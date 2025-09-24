local config = {
    actionId = 3993,
    bossName = "Nimrion",
    bossPosition = Position(856, 1330, 6), -- {x = 827, y = 382, z = 8}
    bossArea = {
        fromPos = Position(851, 1325, 6), -- CANTO SUPERIOR ESQUERDO DA SALA {x = 820, y = 380, z = 8}
        toPos = Position(866, 1337, 6), -- CANTO INFERIOR DIREITO DA SALA {x = 835, y = 388, z = 8}
        entrancePos = Position(863, 1331, 6), -- POSI??O QUE OS PLAYERS SER?O TELEPORTADOS {x = 828, y = 389, z = 8}
        exitPosition = Position(892, 1342, 7) -- POSI??O AO SER EXPULSOS {x = 830, y = 401, z = 8}
    },
    allowedAnyParticipantsCount = true,
    participantsPos = {
        Position(882, 1349, 6) -- PRIMEIRO PUXAR? A ALAVANCA {x = 830, y = 399, z = 8}
    },
    attempts = {
        taskPoints = 200, -- MINIMO DE TASK POINTS
        storage = 3993, -- STORAGE DE ESPERA
        seconds = 72000 -- HORAS DE ESPERA [20]
    },
    createTeleportPos = Position(856, 1330, 6), -- POSI??O QUE SER? CRIADO O TP QUANDO O BOSS MORRER {x = 820, y = 384, z = 8}
    teleportToPosition = Position(892, 1342, 7), -- POSI??O QUE OS PLAYERS SER?O TELETRANSPORTADOS QUANDO FINALIZAREM
    teleportRemoveSeconds = 30,
    kickParticipantAfterSeconds = 60 * 15,
    leverIds = {9825},
    tokenId = 25379, -- ID DA TOKEN 
    tokenCount = 0, -- QTD DA TOKEN 
}

local function getSpectators(onlyPlayers)
    if not config.centerPosition then
        config.diffX = math.ceil((config.bossArea.toPos.x - config.bossArea.fromPos.x) / 2)
        config.diffY = math.ceil((config.bossArea.toPos.y - config.bossArea.fromPos.y) / 2)
        config.centerPosition = config.bossArea.fromPos + Position(config.diffX, config.diffY, 0)
    end
    return Game.getSpectators(config.centerPosition, false, onlyPlayers, config.diffX, config.diffX, config.diffY, config.diffY)
end

local action = Action()

function action.onUse(player, item, fromPos, target, toPos, isHotkey)
    local participants = {}

    for index, pos in pairs(config.participantsPos) do
        local tile = Tile(pos)
        if not tile then error("[Warning - Tile not found]") end
        local participant = tile:getTopVisibleCreature(player)
        if participant and participant:isPlayer() then
            if index == 1 and participant ~= player then
                player:sendCancelMessage("Only the first participant can pull the lever.")
                return true
            end

            if participant:getItemCount(config.tokenId) < config.tokenCount then
                player:sendCancelMessage(string.format("O player %s não tem os tokens.", participant:getName()))
                return true
            end

            if participant:getStorageValue(config.attempts.storage) >= os.time() then
                player:sendCancelMessage(string.format("O player %s precisa esperar para entrar novamente.", participant:getName()))
                return true
            end

            if participant:getStorageValue(5152) < config.attempts.taskPoints then
                player:sendCancelMessage(string.format("O player %s não tem task points suficientes %d.", participant:getName(), config.attempts.taskPoints))
                return true
            end

            participants[#participants +1] = participant
        end
    end

    if #participants == 0 then
        player:sendCancelMessage("You need at least one participant.")
        return true
    elseif not config.allowedAnyParticipantsCount and #participants ~= #config.participantsPos then
        player:sendCancelMessage("You need all participants.")
        return true
    end

    if #getSpectators(true) > 0 then
        player:sendCancelMessage("At this time the room is occupied, please try again later.")
        return true
    end

    stopEvent(config.kickEventId)

    for _, monsterSpectator in pairs(getSpectators()) do
        monsterSpectator:remove()
    end

    local boss = Game.createMonster(config.bossName, config.bossPosition)
    if not boss then
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return true
    end

    boss:registerEvent("nimrionTask")

    for _, participant in pairs(participants) do
        -- Remover a token do participante
        participant:removeItem(config.tokenId, config.tokenCount)

        participant:getPosition():sendMagicEffect(CONST_ME_POFF)
        participant:teleportTo(config.bossArea.entrancePos, false)
        participant:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        participant:setStorageValue(config.attempts.storage, os.time() + config.attempts.seconds)
    end

    config.kickEventId = addEvent(function ()
        for _, spectator in pairs(getSpectators()) do
            if spectator:isPlayer() then
                spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
                spectator:teleportTo(config.bossArea.exitPosition, false)
                spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                spectator:sendTextMessage(MESSAGE_EVENT_ADVANCE, "It's been a long time and you haven't managed to defeat the boss.")
            else
                spectator:remove()
            end
        end
    end, config.kickParticipantAfterSeconds * 1000)
    item:transform(item:getId() == config.leverIds[1] and config.leverIds[2] or config.leverIds[1])
    return true
end

action:aid(config.actionId)
action:register()

local creatureEvent = CreatureEvent("nimrionTask")

function creatureEvent.onDeath()
    stopEvent(config.kickEventId)
    local teleport = Game.createItem(1387, 1, config.createTeleportPos)
    if teleport then
        teleport:setDestination(config.teleportToPosition)
        addEvent(function ()
            local tile = Tile(config.createTeleportPos)
            if tile then
                local teleport = tile:getItemById(1387)
                if teleport then
                    teleport:remove()
                    config.teleportToPosition:sendMagicEffect(CONST_ME_POFF)
                end
            end

            for _, spectator in pairs(getSpectators()) do
                if spectator:isPlayer() then
                    spectator:getPosition():sendMagicEffect(CONST_ME_POFF)
                    spectator:teleportTo(config.teleportToPosition, false)
                    spectator:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                else
                    spectator:remove()
                end
            end
        end, config.teleportRemoveSeconds * 1000)
    end
    return true
end

creatureEvent:register()