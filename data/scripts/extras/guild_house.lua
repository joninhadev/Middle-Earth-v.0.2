local config = {
    -- General Guild House configuration
    guildHouse = {
        database = {
            table = "gh",
            columns = {
                guildId = "guild",
                guildName = "nomeguild"
            }
        },
        
        -- Lever settings and UniqueID
        UniqueID = 7375,
        leverIds = {
            opened = 9825,     -- Lever available for domination
            closed = 9826      -- Lever when already dominated
        },
        
        -- Lever reset time (in seconds)
        leverResetTime = 120,
        
        -- Invasion time constraints
        invasionTime = {
            start = "21:00",  -- Format hh:mm (24 hours)
            endTime = "21:59"
        },
        
        -- Guard areas for access checking
        guardAreas = {
            firstArea = 7371,  -- Action ID for first area
            secondArea = 7372, -- Action ID for second area
            finalArea = 7370   -- Action ID for final area
        }
    },
    
    -- Guards configuration
    guards = {
        -- Guard revive time (in seconds)
        reviveTime = 600,  -- 10 minutes
        -- Guard positions and information
        positions = {
            {name = "Dol Gate Guard", total = 2, order = 1, positions = {
                {x = 1252, y = 716, z = 6}, -- 1252, 716, 6
                {x = 1258, y = 716, z = 6}
            }},
            {name = "Dol Hall Guard", total = 2, order = 2, positions = {
                {x = 1252, y = 705, z = 6},
                {x = 1258, y = 705, z = 6}
            }},
            {name = "Dol Elite Guard", total = 2, order = 3, positions = {
                {x = 1254, y = 690, z = 6},
                {x = 1256, y = 690, z = 6}
            }}
        },
        
        -- Kill tracking
        killTracking = {
            ["Dol Gate Guard"] = { total = 2, killed = 0 },
            ["Dol Hall Guard"] = { total = 2, killed = 0 },
            ["Dol Elite Guard"] = { total = 2, killed = 0 }
        },
        
        -- Guard appearance
        outfit = {
            lookType = 131,
            lookHead = 95,
            lookBody = 95,
            lookLegs = 95,
            lookFeet = 95,
            lookMount = 1191
        },
        
        -- Guard combat settings
        combat = {
            attackRadius = 6,
            attackInterval = 3,
            meleeDamage = {100, 250},
            distDamage = {100, 250},
            distEffect = 17 -- Spear effect
        }
    },
    
    -- Messages
    messages = {
        lever = {
            open = "The door has been opened.",
            close = "The door has been closed.",
            alreadyInvaded = "A guild-house foi dominada recentemente, aguarde um pouco e tente novamente..",
            noGuild = "Você precisa ter uma guild para invadir a guild-house.",
            alreadyDominating = "Sua guild já está dominando a guild-house.",
            wrongTime = "A guild house só pode ser invadida entre as  %s e %s.",
            databaseError = "Erro ao atualizar dominante da guild-house.",
            leverReset = "A alavanca de invasão está pronta para ser usada novamente."
        },
        guards = {
            guardInfo = "A ordem para eliminar os guardas são: 1. Dol Gate Guard, 2. Dol Hall Guard e 3. Dol Elite Guard.",
            guardStatus = "Guards status: %s",
            guardDefeated = "Guards %s (%d/%d): Eliminados!",
            guardRemaining = "Os guardas %s (%d/%d): ainda não foram derrotados!",
            kill = "Você matou %s! (%d/%d guardas.)",
            groupFinished = "All %s were eliminated!"
        },
        domination = {
            conquered = "A guild %s acabou de dominar a guild house de Dol'Guldur!",
            guildExpelled = "A guild %s foi expulsa da guild house de Dol'Guldur.",
            welcome = "Bem vindo a guild house, ela está sendo dominada pela sua guild.",
            notDominant = "Essa guild house pertence a %s. Se quiser invadir, mate todos os guardas e domine a Guild House usando a alavanca."
        }
    }
}


local function timeToMinutes(timeStr)
    local hour, minute = string.match(timeStr, "(%d+):(%d+)")
    return tonumber(hour) * 60 + tonumber(minute)
end

local function isGuildDominant(player)
    local guild = player:getGuild()
    if not guild then
        return false
    end
    
    local resultId = db.storeQuery(string.format(
        "SELECT `%s` FROM `%s` WHERE `%s` = %d LIMIT 1",
        config.guildHouse.database.columns.guildId,
        config.guildHouse.database.table,
        config.guildHouse.database.columns.guildId,
        guild:getId()
    ))
    
    if resultId ~= false then
        result.free(resultId)
        return true
    end
    
    return false
end

local function getDominantGuild()
    local currentDominantGuild = nil
    local resultId = db.storeQuery(string.format(
        "SELECT `%s`, `%s` FROM `%s` WHERE `%s` != 0 LIMIT 1",
        config.guildHouse.database.columns.guildId, 
        config.guildHouse.database.columns.guildName,
        config.guildHouse.database.table, 
        config.guildHouse.database.columns.guildId
    ))
    
    if resultId ~= false then
        currentDominantGuild = {
            id = result.getNumber(resultId, config.guildHouse.database.columns.guildId),
            name = result.getString(resultId, config.guildHouse.database.columns.guildName)
        }
        result.free(resultId)
    end
    
    return currentDominantGuild
end

local function checkGuardStatus(guardName)
    local guardStatus = {}
    local isAlive = false
    
    for _, guardGroup in ipairs(config.guards.positions) do
        if guardGroup.name == guardName then
            guardStatus[guardName] = {
                total = guardGroup.total, 
                alive = 0, 
                order = guardGroup.order
            }
            
            for _, pos in ipairs(guardGroup.positions) do
                local position = Position(pos.x, pos.y, pos.z)
                local tile = Tile(position)
                
                if tile then
                    for _, creature in ipairs(tile:getCreatures()) do
                        if creature:isMonster() and creature:getName() == guardName then
                            guardStatus[guardName].alive = guardStatus[guardName].alive + 1
                            isAlive = true
                        end
                    end
                end
            end
            
            break
        end
    end
    
    return isAlive, guardStatus
end

local function checkAllGuards()
    local allGuardStatus = {}
    local anyGuardAlive = false
    
    for _, guardGroup in ipairs(config.guards.positions) do
        local guardName = guardGroup.name
        local isAlive, guardStatus = checkGuardStatus(guardName)
        
        if isAlive then
            anyGuardAlive = true
        end
        
        for k, v in pairs(guardStatus) do
            allGuardStatus[k] = v
        end
    end
    
    return anyGuardAlive, allGuardStatus
end

local function createGuardStatusMessage(guardStatus)
    local guardsOrdered = {}
    for guardName, status in pairs(guardStatus) do
        table.insert(guardsOrdered, {name = guardName, status = status})
    end
    
    table.sort(guardsOrdered, function(a, b) return a.status.order < b.status.order end)
    
    local statusMessage = ""
    for _, guard in ipairs(guardsOrdered) do
        local guardName = guard.name
        local status = guard.status
        
        if status.alive == 0 then
            statusMessage = statusMessage .. string.format(config.messages.guards.guardDefeated, 
                guardName, status.alive, status.total) .. "\n"
        else
            statusMessage = statusMessage .. string.format(config.messages.guards.guardRemaining, 
                guardName, status.alive, status.total) .. "\n"
        end
    end
    
    return statusMessage
end

local leverAction = Action()
function leverAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.guildHouse.leverIds.closed then
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:sendTextMessage(22, config.messages.lever.alreadyInvaded)
        return true
    end
    
    if item:getId() == config.guildHouse.leverIds.opened then
        local guild = player:getGuild()
        if not guild then
            fromPosition:sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(22, config.messages.lever.noGuild)
            return true
        end
        
        local currentDominantGuild = getDominantGuild()
        if currentDominantGuild and guild:getId() == currentDominantGuild.id then
            fromPosition:sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(22, config.messages.lever.alreadyDominating)
            return true
        end
        
        local currentTime = os.date("%H:%M")
        local currentMinutes = timeToMinutes(currentTime)
        local startMinutes = timeToMinutes(config.guildHouse.invasionTime.start)
        local endMinutes = timeToMinutes(config.guildHouse.invasionTime.endTime)
        
        if currentMinutes < startMinutes or currentMinutes >= endMinutes then
            fromPosition:sendMagicEffect(CONST_ME_POFF)
            player:sendTextMessage(22, 
                string.format(config.messages.lever.wrongTime, 
                    config.guildHouse.invasionTime.start, 
                    config.guildHouse.invasionTime.endTime))
            return true
        end
        
        local anyGuardAlive, allGuardStatus = checkAllGuards()
        if anyGuardAlive then
            fromPosition:sendMagicEffect(CONST_ME_POFF)
            
            player:sendTextMessage(22, config.messages.guards.guardInfo)
            
            local statusMessage = createGuardStatusMessage(allGuardStatus)
            player:sendTextMessage(22, 
                string.format(config.messages.guards.guardStatus, statusMessage))
            
            return true
        end
        
        fromPosition:sendMagicEffect(CONST_ME_THUNDER)
        
        if currentDominantGuild then
            Game.broadcastMessage(
                string.format(config.messages.domination.guildExpelled, currentDominantGuild.name), 
                22
            )
        end
        
        Game.broadcastMessage(
            string.format(config.messages.domination.conquered, guild:getName()), 
            22
        )
        
        local db_table = config.guildHouse.database.table
        local column_id = config.guildHouse.database.columns.guildId
        local column_name = config.guildHouse.database.columns.guildName
        
        local success, errorMsg = pcall(function()
            db.query(string.format("DELETE FROM `%s` WHERE `%s` != 0", db_table, column_id))
            
            db.query(string.format(
                "INSERT INTO `%s` (`%s`,`%s`,`domination_time`) VALUES (%d, '%s', %d)",
                db_table, column_id, column_name, guild:getId(), 
                guild:getName():gsub("'", "''"), os.time()
            ))
        end)
        
        if not success then
            print("Error updating database: " .. tostring(errorMsg))
            player:sendTextMessage(22, config.messages.lever.databaseError)
            return true
        end
        
        item:transform(config.guildHouse.leverIds.closed)
        
        addEvent(function()
            local lever = Tile(fromPosition):getItemById(config.guildHouse.leverIds.closed)
            if lever then
                lever:transform(config.guildHouse.leverIds.opened)
                Game.broadcastMessage(config.messages.lever.leverReset, MESSAGE_STATUS_CONSOLE_ORANGE)
            end
        end, config.guildHouse.leverResetTime * 1000)
        
        return true
    end
    
    return false
end

leverAction:uid(config.guildHouse.UniqueID)
leverAction:register()

local statues = {}

local function createStatue(guardInfo, index)
    local creatureType = ""
    
    if guardInfo.name == "Dol Gate Guard" then
        creatureType = "Dol Gate Guard"
    elseif guardInfo.name == "Dol Hall Guard" then
        creatureType = "Dol Hall Guard"
    elseif guardInfo.name == "Dol Elite Guard" then
        creatureType = "Dol Elite Guard"
    else
        return
    end
    
    if creatureType == "" then
        return
    end
    
    for posIndex, pos in ipairs(guardInfo.positions) do
        local position = Position(pos.x, pos.y, pos.z)
        local statue = Game.createMonster(creatureType, position)
        
        if statue then
            statue:setOutfit(config.guards.outfit)
            --statue:setMovementBlocked(true)
            
            local statueId = #statues + 1
            statues[statueId] = {
                id = statue:getId(), 
                type = creatureType, 
                name = guardInfo.name,
                pos = {x = pos.x, y = pos.y, z = pos.z}
            }
            
            statue:registerEvent("StatueDeath")
        end
    end
end

local function createAllStatues()
    for _, guardInfo in ipairs(config.guards.positions) do
        createStatue(guardInfo, 0)
    end
end

local function attackPlayers()
    for _, statueData in ipairs(statues) do
        local statue = Creature(statueData.id)
        if statue and statue:isMonster() then
            local statuePos = statue:getPosition()
            
            local spectators = Game.getSpectators(statuePos, false, true, 
                config.guards.combat.attackRadius, config.guards.combat.attackRadius, 
                config.guards.combat.attackRadius, config.guards.combat.attackRadius)
            
            for _, spectator in ipairs(spectators) do
                if spectator:isPlayer() and not isGuildDominant(spectator) then
                    local distance = getDistanceBetween(statuePos, spectator:getPosition())
                    local damage = 0
                    
                    if distance <= 1 then
                        damage = math.random(config.guards.combat.meleeDamage[1], config.guards.combat.meleeDamage[2])
                        doTargetCombatHealth(statue, spectator, COMBAT_PHYSICALDAMAGE, -damage, -damage, CONST_ME_HITAREA)
                    else
                        damage = math.random(config.guards.combat.distDamage[1], config.guards.combat.distDamage[2])
                        doTargetCombatHealth(statue, spectator, COMBAT_PHYSICALDAMAGE, -damage, -damage, CONST_ME_NONE)
                        statuePos:sendDistanceEffect(spectator:getPosition(), config.guards.combat.distEffect)
                    end
                end
            end
        end
    end
end

local statueAttack = GlobalEvent("StatueAttack")
function statueAttack.onThink(interval)
    attackPlayers()
    return true
end
statueAttack:interval(config.guards.combat.attackInterval * 1000)
statueAttack:register()

local startupEvent = GlobalEvent("StartupStatues")
function startupEvent.onStartup()
    createAllStatues()
    return true
end
startupEvent:register()

local GuildHouseGuardKill = CreatureEvent("GuildHouseGuardKill")
function GuildHouseGuardKill.onKill(creature, target)
    if creature:isPlayer() then
        local targetName = target:getName()
        local guardInfo = config.guards.killTracking[targetName]
        
        if guardInfo then
            guardInfo.killed = guardInfo.killed + 1
            
            creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 
                string.format(config.messages.guards.kill, 
                    targetName, 
                    guardInfo.killed, 
                    guardInfo.total
                )
            )
            
            if guardInfo.killed == guardInfo.total then
                creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 
                    string.format(config.messages.guards.groupFinished, targetName)
                )
                
                guardInfo.killed = 0
            end
        end
    end
    
    return true
end
GuildHouseGuardKill:register()

local login_killGH = CreatureEvent("login_killGH")
function login_killGH.onLogin(player)
    player:registerEvent('GuildHouseGuardKill')
    return true
end
login_killGH:register()

local firstGuardArea = MoveEvent()
function firstGuardArea.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
    
    local guild = player:getGuild()
    if not guild then
        player:sendTextMessage(22, config.messages.lever.noGuild)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(fromPosition)
        return false
    end
    
    local currentDominantGuild = getDominantGuild()
    if currentDominantGuild and guild:getId() == currentDominantGuild.id then
        player:sendTextMessage(22, config.messages.domination.welcome)
        return true
    end
    
    
    local currentTime = os.date("%H:%M")
    local currentMinutes = timeToMinutes(currentTime)
    local startMinutes = timeToMinutes(config.guildHouse.invasionTime.start)
    local endMinutes = timeToMinutes(config.guildHouse.invasionTime.endTime)
    
    if currentMinutes < startMinutes or currentMinutes >= endMinutes then
        player:sendTextMessage(22, 
            string.format(config.messages.lever.wrongTime, 
                config.guildHouse.invasionTime.start, 
                config.guildHouse.invasionTime.endTime))
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(fromPosition)
        return false
    end
    
    local guardsAlive = false
    
    for _, guardGroup in ipairs(config.guards.positions) do
        if guardGroup.name == "Dol Gate Guard" then
            for _, pos in ipairs(guardGroup.positions) do
                local position = Position(pos.x, pos.y, pos.z)
                local tile = Tile(position)
                
                if tile then
                    for _, creature in ipairs(tile:getCreatures()) do
                        if creature:isMonster() and creature:getName() == "Dol Gate Guard" then
                            guardsAlive = true
                        end
                    end
                end
            end
        end
    end
    
    if guardsAlive then
        player:sendTextMessage(22, config.messages.guards.guardInfo)
        player:sendTextMessage(22, "Para invadir a guild-house você precisa matar os guardas.")
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(fromPosition)
        return false
    end
    
    return true
end
firstGuardArea:type("stepin")
firstGuardArea:aid(config.guildHouse.guardAreas.firstArea)
firstGuardArea:register()

local secondGuardArea = MoveEvent()
function secondGuardArea.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
    
    
    local guild = player:getGuild()
    if not guild then
        player:sendTextMessage(22, config.messages.lever.noGuild)
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return false
    end
    
    local currentDominantGuild = getDominantGuild()
    if currentDominantGuild and guild:getId() == currentDominantGuild.id then
        player:sendTextMessage(22, config.messages.domination.welcome)
        return true
    end
    
    local currentTime = os.date("%H:%M")
    local currentMinutes = timeToMinutes(currentTime)
    local startMinutes = timeToMinutes(config.guildHouse.invasionTime.start)
    local endMinutes = timeToMinutes(config.guildHouse.invasionTime.endTime)
    
    if currentMinutes < startMinutes or currentMinutes >= endMinutes then
        player:sendTextMessage(22, 
            string.format(config.messages.lever.wrongTime, 
                config.guildHouse.invasionTime.start, 
                config.guildHouse.invasionTime.endTime))
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return false
    end
    
    local guardsAlive = false
    
    for _, guardGroup in ipairs(config.guards.positions) do
        if guardGroup.name == "Dol Gate Guard" then
            for _, pos in ipairs(guardGroup.positions) do
                local position = Position(pos.x, pos.y, pos.z)
                local tile = Tile(position)
                
                if tile then
                    for _, creature in ipairs(tile:getCreatures()) do
                        if creature:isMonster() and creature:getName() == "Dol Gate Guard" then
                            guardsAlive = true
                        end
                    end
                end
            end
        end
    end
    
    if guardsAlive then
        player:sendTextMessage(22, config.messages.guards.guardInfo)
        player:sendTextMessage(22, "Você precisa matar os guardas primeiro.")
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(fromPosition)
        return false
    end
    
    guardsAlive = false
    for _, guardGroup in ipairs(config.guards.positions) do
        if guardGroup.name == "Dol Hall Guard" then
            for _, pos in ipairs(guardGroup.positions) do
                local position = Position(pos.x, pos.y, pos.z)
                local tile = Tile(position)
                
                if tile then
                    for _, creature in ipairs(tile:getCreatures()) do
                        if creature:isMonster() and creature:getName() == "Dol Hall Guard" then
                            guardsAlive = true
                        end
                    end
                end
            end
        end
    end
    
    if guardsAlive then
        player:sendTextMessage(22, config.messages.guards.guardInfo)
        player:sendTextMessage(22, "Você precisa matar os guardas primeiro.")
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(fromPosition)
        return false
    end
    
    return true
end
secondGuardArea:type("stepin")
secondGuardArea:aid(config.guildHouse.guardAreas.secondArea)
secondGuardArea:register()

local finalGuardArea = MoveEvent()
function finalGuardArea.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
    
    local guild = player:getGuild()
    if not guild then
        player:sendTextMessage(22, config.messages.lever.noGuild)
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return false
    end
    
    local currentDominantGuild = getDominantGuild()
    if currentDominantGuild and guild:getId() == currentDominantGuild.id then
        player:sendTextMessage(22, config.messages.domination.welcome)
        return true
    end
    
    local currentTime = os.date("%H:%M")
    local currentMinutes = timeToMinutes(currentTime)
    local startMinutes = timeToMinutes(config.guildHouse.invasionTime.start)
    local endMinutes = timeToMinutes(config.guildHouse.invasionTime.endTime)
    
    if currentMinutes < startMinutes or currentMinutes >= endMinutes then
        player:sendTextMessage(22, 
            string.format(config.messages.lever.wrongTime, 
                config.guildHouse.invasionTime.start, 
                config.guildHouse.invasionTime.endTime))
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        return false
    end
    
    local guardsAlive = false
    for _, guardGroup in ipairs(config.guards.positions) do
        if guardGroup.name == "Dol Elite Guard" then
            for _, pos in ipairs(guardGroup.positions) do
                local position = Position(pos.x, pos.y, pos.z)
                local tile = Tile(position)
                
                if tile then
                    for _, creature in ipairs(tile:getCreatures()) do
                        if creature:isMonster() and creature:getName() == "Dol Elite Guard" then
                            guardsAlive = true
                        end
                    end
                end
            end
        end
    end
    
   if guardsAlive then
        player:sendTextMessage(22, config.messages.guards.guardInfo)
        player:sendTextMessage(22, "You must defeat the elite guards.")
        fromPosition:sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(fromPosition)
        return false
    end
    
    player:teleportTo(fromPosition)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 
        string.format(config.messages.domination.notDominant, 
            currentDominantGuild and currentDominantGuild.name or "a guild"))
    fromPosition:sendMagicEffect(CONST_ME_POFF)
    return false
end

finalGuardArea:type("stepin")
finalGuardArea:aid(config.guildHouse.guardAreas.finalArea)
finalGuardArea:register()

local INFO_CONFIG = {
    UniqueID = 5865,
    guardTypes = {
        ["Dol Gate Guard"] = {
            description = "The first line of defense. These guards use spears for ranged attacks and have moderate damage.",
            damage = "Melee: 300-450 | Ranged: 200-350",
            special = "Must be defeated first to advance to the next area."
        },
        ["Dol Hall Guard"] = {
            description = "Secondary defenders with enhanced abilities. More resilient than Gate Guards.",
            damage = "Melee: 300-450 | Ranged: 200-350",
            special = "Must be defeated after Gate Guards to reach the final area."
        },
        ["Dol Elite Guard"] = {
            description = "The strongest defenders with high damage output and resistance.",
            damage = "Melee: 300-450 | Ranged: 200-350",
            special = "Final guards that must be defeated to use the domination lever."
        }
    }
}

local function getGuildMembersInfo(guildId)
    if not guildId then 
        return {
            total = 0,
            online = 0,
            leader = "None",
            viceLeaders = {},
            members = {}
        }
    end
    
    local guildInfo = {
        total = 0,
        online = 0,
        leader = "Unknown",
        viceLeaders = {},
        members = {}
    }
    
    local resultId = db.storeQuery(string.format([[
        SELECT p.name 
        FROM players p 
        JOIN guilds g ON p.id = g.ownerid 
        WHERE g.id = %d
    ]], guildId))
    
    if resultId then
        guildInfo.leader = result.getString(resultId, "name")
        result.free(resultId)
    end
    
    resultId = db.storeQuery(string.format([[
        SELECT 
            p.name, 
            gr.level,
            gm.nick 
        FROM players p 
        JOIN guild_membership gm ON p.id = gm.player_id 
        JOIN guild_ranks gr ON gm.rank_id = gr.id 
        WHERE gm.guild_id = %d
        ORDER BY gr.level DESC, p.name ASC
    ]], guildId))
    
    if resultId then
        repeat
            local name = result.getString(resultId, "name")
            local rankLevel = result.getNumber(resultId, "level")
            local nick = ""
            
            if result.getDataString(resultId, "nick") then
                nick = result.getString(resultId, "nick")
            end
            
            local displayName = name
            if nick and nick ~= "" then
                displayName = displayName .. " (" .. nick .. ")"
            end
            
           guildInfo.total = guildInfo.total + 1
            
            if Player(name) then
                guildInfo.online = guildInfo.online + 1
            end
            
            if name ~= guildInfo.leader then
                if rankLevel == 2 then
                    table.insert(guildInfo.viceLeaders, displayName)
                else
                    table.insert(guildInfo.members, displayName)
                end
            end
        until not result.next(resultId)
        
        result.free(resultId)
    end
    
    return guildInfo
end

local function formatTimestamp(timestamp)
    if not timestamp or timestamp == 0 then
        return "Unknown"
    end
    
    return os.date("%d/%m/%Y %H:%M:%S", timestamp)
end

local function getRemainingLockoutTime(dominationTime, resetTimeSeconds)
    if not dominationTime then return "Available now" end
    
    local currentTime = os.time()
    local lockoutEndTime = dominationTime + resetTimeSeconds
    
    if currentTime >= lockoutEndTime then
        return "Available now"
    else
        local remainingSeconds = lockoutEndTime - currentTime
        local hours = math.floor(remainingSeconds / 3600)
        local minutes = math.floor((remainingSeconds % 3600) / 60)
        
        return string.format("%d hours, %d minutes", hours, minutes)
    end
end

local function getGuardsStatus()
    local guardStatus = {}
    
    for _, guardGroup in ipairs(config.guards.positions) do
        local guardName = guardGroup.name
        local aliveCount = 0
        
        for _, pos in ipairs(guardGroup.positions) do
            local position = Position(pos.x, pos.y, pos.z)
            local tile = Tile(position)
            
            if tile then
                for _, creature in ipairs(tile:getCreatures()) do
                    if creature:isMonster() and creature:getName() == guardName then
                        aliveCount = aliveCount + 1
                    end
                end
            end
        end
        
        guardStatus[guardName] = {
            alive = aliveCount,
            total = guardGroup.total
        }
    end
    
    return guardStatus
end

local informationAction = Action()

function informationAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local dominatingGuild = nil
    local dominationTime = nil
    
    local resultId = db.storeQuery(string.format(
        "SELECT `%s`, `%s`, `domination_time` FROM `%s` WHERE `%s` != 0 LIMIT 1",
        config.guildHouse.database.columns.guildId, 
        config.guildHouse.database.columns.guildName,
        config.guildHouse.database.table, 
        config.guildHouse.database.columns.guildId
    ))
    
    if resultId ~= false then
        dominatingGuild = {
            id = result.getNumber(resultId, config.guildHouse.database.columns.guildId),
            name = result.getString(resultId, config.guildHouse.database.columns.guildName)
        }
        
        if result.getDataLong(resultId, "domination_time") then
            dominationTime = result.getNumber(resultId, "domination_time")
        end
        
        result.free(resultId)
    end
    
    local guardStatus = getGuardsStatus()
    
    local message = "==========================================\n"
    message = message .. "                                  Guild House of Dol'Guldur         \n"
    message = message .. "==========================================\n\n"
    
    if dominatingGuild then
        local guildInfo = getGuildMembersInfo(dominatingGuild.id)
        
        message = message .. "Dominating Guild: " .. dominatingGuild.name .. "\n"
        message = message .. "Total Members: " .. guildInfo.total .. " (" .. guildInfo.online .. " online)\n"
        message = message .. "Dominated Since: " .. formatTimestamp(dominationTime) .. "\n"
        message = message .. "Next Invasion: " .. getRemainingLockoutTime(dominationTime, config.guildHouse.leverResetTime) .. "\n\n"
        
        message = message .. "==========================================\n"
        message = message .. "                                 Guild Leadership             \n"
        message = message .. "==========================================\n"
        message = message .. "Leader: " .. guildInfo.leader .. "\n"
        
        if #guildInfo.viceLeaders > 0 then
            message = message .. "Vice-Leaders:\n"
            for _, viceName in ipairs(guildInfo.viceLeaders) do
                message = message .. "- " .. viceName .. "\n"
            end
        else
            message = message .. "Vice-Leaders: None\n"
        end
        
        if #guildInfo.members > 0 then
            message = message .. "\nMembers: "
            local maxToShow = math.min(5, #guildInfo.members)
            for i = 1, maxToShow do
                message = message .. guildInfo.members[i]
                if i < maxToShow then
                    message = message .. ", "
                end
            end
            
            if #guildInfo.members > maxToShow then
                message = message .. " and " .. (#guildInfo.members - maxToShow) .. " more"
            end
            message = message .. "\n"
        end
        
        message = message .. "\n"
    else
        message = message .. "Status: Not currently dominated by any guild\n\n"
    end
    
    message = message .. "Invasion Times: " .. config.guildHouse.invasionTime.start .. " - " .. config.guildHouse.invasionTime.endTime .. "\n\n"
    
    message = message .. "==========================================\n"
    message = message .. "                                Guard Information           \n"
    message = message .. "==========================================\n\n"
    
    for _, guardGroup in ipairs(config.guards.positions) do
        local guardName = guardGroup.name
        local status = guardStatus[guardName]
        local guardConfig = INFO_CONFIG.guardTypes[guardName]
        
        if status and guardConfig then
            message = message .. guardName .. " (" .. status.alive .. "/" .. status.total .. ")\n"
            message = message .. "- " .. guardConfig.description .. "\n"
            message = message .. "- Damage: " .. guardConfig.damage .. "\n"
            message = message .. "- Special: " .. guardConfig.special .. "\n\n"
        end
    end
    
    message = message .. "==========================================\n"
    message = message .. "                              How to Dominate           \n"
    message = message .. "==========================================\n"
    message = message .. "1. Defeat all guards in order\n"
    message = message .. "2. Use the lever at the end to claim dominance\n"
    message = message .. "3. Only possible during invasion hours: " .. config.guildHouse.invasionTime.start .. " - " .. config.guildHouse.invasionTime.endTime
    
    player:popupFYI(message)
    return true
end

informationAction:uid(INFO_CONFIG.UniqueID)
informationAction:register()

local function setupDatabase()
    local resultId = db.storeQuery(string.format(
        "SHOW COLUMNS FROM `%s` LIKE 'domination_time'",
        config.guildHouse.database.table
    ))
    
    if not resultId then
        db.query(string.format(
            "ALTER TABLE `%s` ADD COLUMN `domination_time` INT UNSIGNED NOT NULL DEFAULT 0",
            config.guildHouse.database.table
        ))
    else
        result.free(resultId)
    end
end

local startupDbSetup = GlobalEvent("StartupDatabaseSetup")
function startupDbSetup.onStartup()
    setupDatabase()
    return true
end
startupDbSetup:register()

local statueRespawn = GlobalEvent("StatueRespawn")
function statueRespawn.onThink(interval)
    for _, guardGroup in ipairs(config.guards.positions) do
        for _, pos in ipairs(guardGroup.positions) do
            local position = Position(pos.x, pos.y, pos.z)
            local tile = Tile(position)
            local creatureFound = false

            if tile then
                for _, creature in ipairs(tile:getCreatures()) do
                    -- Verifica pelo NOME real do guard
                    if creature:isMonster() and creature:getName() == guardGroup.name then
                        creatureFound = true
                        break
                    end
                end
            end

            if not creatureFound then
                -- Criar monstro com o NOME real
                local statue = Game.createMonster(guardGroup.name, position)
                if statue then
                    statue:setOutfit(config.guards.outfit)
                    --statue:setMovementBlocked(true)

                    local statueId = #statues + 1
                    statues[statueId] = {
                        id = statue:getId(), 
                        type = guardGroup.name, 
                        name = guardGroup.name,
                        pos = {x = pos.x, y = pos.y, z = pos.z}
                    }

                    statue:registerEvent("StatueDeath")
                end
            end
        end
    end

    return true
end
statueRespawn:interval(config.guards.reviveTime * 1000)
statueRespawn:register()


local statueDeath = CreatureEvent("StatueDeath")
function statueDeath.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    local statueId = nil
    
    for id, data in pairs(statues) do
        if data.id == creature:getId() then
            statueId = id
            break
        end
    end
    
    if statueId then
        table.remove(statues, statueId)
    end
    
    return true
end
statueDeath:register()