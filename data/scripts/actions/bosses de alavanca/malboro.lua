local config = {
    actionId = 5942,
    bossName = "Malboro",
    bossPosition = Position(1453, 546, 7),
    bossArea = {
        fromPos = Position(1445, 540, 7),
        toPos = Position(1473, 562, 7),
        entrancePos = Position(1461, 555, 7),
        exitPosition = Position(1385, 531, 8)
    },
    allowedAnyParticipantsCount = true,
    participantsPos = {
        Position(1384, 533, 8),
        Position(1384, 532, 8),
        Position(1384, 531, 8),
        Position(1384, 530, 8),
        Position(1384, 529, 8)
    },
    attempts = {
        storage = 5942,
        seconds = 72000
    },
    createTeleportPos = Position(226, 1741, 7),
    teleportToPosition = Position(1385, 531, 8),
    teleportRemoveSeconds = 60,
    kickParticipantAfterSeconds = 60 * 15,
    leverIds = {9825},
    minLevel = 250 -- Nível mínimo requerido
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
            -- Verificar se é o primeiro participante
            if index == 1 and participant ~= player then
                player:sendCancelMessage("Apenas o primeiro participante pode puxar a alavanca..")
                return true
            end

            -- Verificar nível mínimo
            if participant:getLevel() < config.minLevel then
                player:sendCancelMessage(string.format("O jogador %s precisa ser level %d.", participant:getName(), config.minLevel))
                return true
            end

            -- Verificar tempo de espera
            if participant:getStorageValue(config.attempts.storage) >= os.time() then
                player:sendCancelMessage(string.format("O jogador %s precisa esperar para entrar novamente.", participant:getName()))
                return true
            end

            participants[#participants +1] = participant
        end
    end

    if #participants == 0 then
        player:sendCancelMessage("Você precisa ter pelo menos 1 participante.")
        return true
    elseif not config.allowedAnyParticipantsCount and #participants ~= #config.participantsPos then
        player:sendCancelMessage("Você precisa ter todos os participantes.")
        return true
    end

    if #getSpectators(true) > 0 then
        player:sendCancelMessage("A sala está ocupada, tente novamente mais tarde.")
        return true
    end

    stopEvent(config.kickEventId)

    -- Remover monstros existentes na sala
    for _, monsterSpectator in pairs(getSpectators()) do
        monsterSpectator:remove()
    end

    -- Criar o boss
    local boss = Game.createMonster(config.bossName, config.bossPosition)
    if not boss then
        player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return true
    end

    boss:registerEvent("bossMalboro")

    -- Teleportar participantes
    for _, participant in pairs(participants) do
        participant:getPosition():sendMagicEffect(CONST_ME_POFF)
        participant:teleportTo(config.bossArea.entrancePos, false)
        participant:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        participant:setStorageValue(config.attempts.storage, os.time() + config.attempts.seconds)
    end

    -- Configurar evento para expulsar jogadores se demorarem muito
    config.kickEventId = addEvent(function()
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

local creatureEvent = CreatureEvent("bossMalboro")

function creatureEvent.onDeath()
    stopEvent(config.kickEventId)
    
    -- Criar teleporte temporário
    local teleport = Game.createItem(1387, 1, config.createTeleportPos)
    if teleport then
        teleport:setDestination(config.teleportToPosition)
        
        addEvent(function()
            local tile = Tile(config.createTeleportPos)
            if tile then
                local teleport = tile:getItemById(1387)
                if teleport then
                    teleport:remove()
                    config.teleportToPosition:sendMagicEffect(CONST_ME_POFF)
                end
            end

            -- Remover todos os espectadores da sala
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