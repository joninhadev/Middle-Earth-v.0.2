local config = {
    actionId = 3995,
    bossName = "Morvandir",
    bossPosition = Position(1799, 1141, 8),
    bossArea = {
        fromPos = Position(1791, 1137, 8),
        toPos = Position(1810, 1156, 8),
        entrancePos = Position(1800, 1152, 8),
        exitPosition = Position(1823, 1143, 8)
    },
    allowedAnyParticipantsCount = true,
    participantsPos = {
        Position(1835, 1136, 8)
    },
    attempts = {
        taskPoints = 450, -- PONTOS DE TASK QUE SERÃO REMOVIDOS
        storage = 3995, -- STORAGE DE ESPERA
        seconds = 80 -- TEMPO DE ESPERA [20 horas]
    },
    createTeleportPos = Position(1799, 1141, 8),
    teleportToPosition = Position(1823, 1143, 8),
    teleportRemoveSeconds = 60,
    kickParticipantAfterSeconds = 60 * 15,
    leverIds = {9825}
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

    boss:registerEvent("morvandirTask")

    for _, participant in pairs(participants) do
        -- REMOVER OS TASK POINTS DO PARTICIPANTE
        participant:setStorageValue(5152, participant:getStorageValue(5152) - config.attempts.taskPoints)
        
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

local creatureEvent = CreatureEvent("morvandirTask")

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