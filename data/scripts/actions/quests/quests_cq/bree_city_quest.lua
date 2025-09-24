local edorascQ = Action()

local config = {
    positions = {
        {x = 578, y = 512, z = 7},
        {x = 579, y = 512, z = 7},
        {x = 580, y = 512, z = 7},
        {x = 581, y = 512, z = 7}
    },
    teleportPositions = {
        {x = 602, y = 520, z = 8}, -- 602, 520, 8
        {x = 604, y = 520, z = 8},
        {x = 606, y = 520, z = 8},
        {x = 604, y = 524, z = 8}
    },
    requiredLevelMin = 35,
    requiredLevelMax = 45,
    storageKey = 5005,
    cooldownStorage = 6002,
    cooldownTime = 15 * 60,
    questArea = {
        fromPosition = {x = 577, y = 344, z = 8}, -- 577, 344, 8
        toPosition = {x = 610, y = 527, z = 8}, -- 610, 527, 8
        expelPosition = {x = 579, y = 519, z = 7} -- 579, 519, 7
    },
    gates = {
        {aid = 2011, pos = Position(590, 497, 8)},
        {aid = 2012, pos = Position(590, 470, 8)},
        {aid = 2013, pos = Position(590, 443, 8)},
        {aid = 2014, pos = Position(590, 416, 8)},
        {aid = 2015, pos = Position(590, 389, 8)},
        {aid = 2016, pos = Position(590, 362, 8)}
    }
}

local function expelPlayersAndCreaturesFromArea(fromPosition, toPosition, expelPosition)
    local expelPos = Position(expelPosition.x, expelPosition.y, expelPosition.z)
    for x = fromPosition.x, toPosition.x do
        for y = fromPosition.y, toPosition.y do
            local tile = Tile(Position(x, y, fromPosition.z))
            if tile then
                local creature = tile:getTopCreature()
                if creature then
                    if creature:isPlayer() then
                        creature:teleportTo(expelPos)
                        expelPos:sendMagicEffect(CONST_ME_TELEPORT)
                        creature:sendTextMessage(MESSAGE_STATUS_WARNING, "Você foi expulso da área da quest.")
                    elseif creature:isMonster() then
                        creature:remove()
                    end
                end
            end
        end
    end
end

local function closeGates()
    for _, gate in ipairs(config.gates) do
        local gateTile = Tile(gate.pos)
        if gateTile then
            local gateItem = gateTile:getItemById(5734) 
            if gateItem then
                gateItem:transform(5733) 
            end
        end
    end
end

local function playerHasItem2086(player)
    return player:getItemCount(2086) > 0
end

local function checkStorageForAnyPlayer()
    for i, position in ipairs(config.positions) do
        local tile = Tile(Position(position.x, position.y, position.z))
        if tile then
            local creature = tile:getTopCreature()
            if creature and creature:isPlayer() then
                if creature:getStorageValue(5006) > 0 then
                    return true, creature 
                end
            end
        end
    end
    return false
end

function edorascQ.onUse(player, item, fromPosition, target, toPosition)

    local hasStorage, playerWithStorage = checkStorageForAnyPlayer()
    if hasStorage then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "A quest não pode ser iniciada porque o jogador " .. playerWithStorage:getName() .. " j? completou a quest.")
        return true
    end

    for i, position in ipairs(config.positions) do
        local tile = Tile(Position(position.x, position.y, position.z))
        if tile then
            local creature = tile:getTopCreature()
            if creature and creature:isPlayer() then
                if playerHasItem2086(creature) then
                    creature:sendTextMessage(MESSAGE_INFO_DESCR, "Você não pode entrar com chaves nessa quest.")
                    player:sendTextMessage(MESSAGE_INFO_DESCR, "Um dos jogadores está com alguma chave na mochila.")
                    return true
                end
            end
        end
    end

    if playerHasItem2086(player) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você não pode entrar na quest com a chave (ID 2086) em sua mochila.")
        return true
    end

    if player:getPosition() ~= Position(config.positions[1].x, config.positions[1].y, config.positions[1].z) then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você precisa estar na posição correta para puxar a alavanca.")
        return true
    end

    if player:getLevel() < config.requiredLevelMin or player:getLevel() > config.requiredLevelMax then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa estar entre os níveis " .. config.requiredLevelMin .. " e " .. config.requiredLevelMax .. " para puxar a alavanca.")
        return true
    end

    local currentTime = os.time()
    local lastUsed = player:getStorageValue(config.cooldownStorage)
    if lastUsed > 0 and currentTime - lastUsed < config.cooldownTime then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "A alavanca só poderá ser usada novamente em " .. (config.cooldownTime - (currentTime - lastUsed)) .. " segundos.")
        return true
    end

    closeGates()

    expelPlayersAndCreaturesFromArea(
        Position(config.questArea.fromPosition.x, config.questArea.fromPosition.y, config.questArea.fromPosition.z),
        Position(config.questArea.toPosition.x, config.questArea.toPosition.y, config.questArea.toPosition.z),
        config.questArea.expelPosition
    )

    local eligiblePlayers = {}
    for i, position in ipairs(config.positions) do
        local tile = Tile(Position(position.x, position.y, position.z))
        if tile then
            local creature = tile:getTopCreature()
            if creature and creature:isPlayer() then
                if creature:getLevel() >= config.requiredLevelMin and creature:getLevel() <= config.requiredLevelMax and creature:getStorageValue(config.storageKey) ~= 1 then
                    table.insert(eligiblePlayers, creature)
                else
                    creature:sendTextMessage(MESSAGE_STATUS_SMALL, "Algum dos jogadores não está entre os níveis " .. config.requiredLevelMin .. " e " .. config.requiredLevelMax .. ".")
                    return true
                end
            end
        end
    end

    for i, player in ipairs(eligiblePlayers) do
        local teleportPos = Position(config.teleportPositions[i].x, config.teleportPositions[i].y, config.teleportPositions[i].z)
        player:teleportTo(teleportPos)
        teleportPos:sendMagicEffect(CONST_ME_TELEPORT)
    end

    player:setStorageValue(config.cooldownStorage, currentTime)
    return true
end

edorascQ:uid(1210)
edorascQ:register()


------------------------------------------------ [[ SUMONANDO AS CRIATURAS DAS SALAS ]] -------------------------------------------------------

local spawnMobs = Action()

local mobsAndPositionsByUID = {
    [1211] = {
        mobs = {
            {name = "elite novice", pos = Position(585, 502, 8)},
            {name = "elite novice", pos = Position(585, 507, 8)},
            {name = "elite novice", pos = Position(585, 512, 8)},
            {name = "elite novice", pos = Position(595, 502, 8)},
            {name = "elite novice", pos = Position(595, 507, 8)},
            {name = "elite novice", pos = Position(595, 512, 8)}
        }
    },
    [1212] = {
        mobs = {
            {name = "elite dark monk", pos = Position(585, 474, 8)},
            {name = "elite dark monk", pos = Position(585, 479, 8)},
            {name = "elite dark monk", pos = Position(585, 483, 8)},
            {name = "elite dark monk", pos = Position(594, 474, 8)},
            {name = "elite dark monk", pos = Position(594, 479, 8)},
            {name = "elite dark monk", pos = Position(594, 483, 8)}
        }
    },
    [1213] = {
        mobs = {
            {name = "elite witch", pos = Position(585, 447, 8)},
            {name = "elite witch", pos = Position(585, 451, 8)},
            {name = "elite witch", pos = Position(585, 454, 8)},
            {name = "elite witch", pos = Position(593, 447, 8)},
            {name = "elite witch", pos = Position(593, 451, 8)},
            {name = "elite witch", pos = Position(593, 454, 8)}
        }
    },
    [1214] = {
        mobs = {
            {name = "elite monk", pos = Position(586, 419, 8)},
            {name = "elite monk", pos = Position(586, 423, 8)},
            {name = "elite monk", pos = Position(586, 426, 8)},
            {name = "elite monk", pos = Position(594, 420, 8)},
            {name = "elite monk", pos = Position(594, 424, 8)},
            {name = "elite monk", pos = Position(594, 427, 8)}
        }
    },
    [1215] = {
        mobs = {
            {name = "elite acolyte", pos = Position(586, 392, 8)},
            {name = "elite acolyte", pos = Position(586, 395, 8)},
            {name = "elite acolyte", pos = Position(586, 398, 8)},
            {name = "elite acolyte", pos = Position(593, 393, 8)},
            {name = "elite acolyte", pos = Position(593, 397, 8)},
            {name = "elite acolyte", pos = Position(593, 401, 8)}
        }
    },
    [1216] = {
        mobs = {
            {name = "ratzinger", pos = Position(590, 372, 8)}
        }
    },
}

local exhaustTime = 3
local exhaustStorage = 60002

function spawnMobs.onUse(player, item, position, fromPosition)
    local currentTime = os.time()
    local lastUsed = player:getStorageValue(exhaustStorage)

    if lastUsed > 0 and currentTime - lastUsed < exhaustTime then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa esperar " .. (exhaustTime - (currentTime - lastUsed)) .. " segundos para usar a alavanca novamente.")
        return true
    end

    local config = mobsAndPositionsByUID[item.uid]
    if not config then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Nada acontece.")
        return true
    end

    player:setStorageValue(exhaustStorage, currentTime)

    if item.itemid == 1946 then
        item:transform(1945)
    else
        item:transform(1946)
        for _, mobData in ipairs(config.mobs) do
            Game.createMonster(mobData.name, mobData.pos)
            mobData.pos:sendMagicEffect(CONST_ME_TELEPORT)
        end
    end

    return true
end

spawnMobs:uid(1211, 1212, 1213, 1214, 1215, 1216)
spawnMobs:register()

------------------------------------------------ [[ DANDO A RECOMPENSA AO PLAYER ]] -------------------------------------------------------

local cqReward = Action()

local itens = {
    { name = "blue robe", id = 2656},
    { name = "knight legs", id = 2477},
    { name = "crystal rod", id = 2184},
    { name = "crystal coin", id = 2160},
    { name = "castle shield", id = 2535},
    { name = "magician hat", id = 2323}
}

local storageKey = 5006

function cqReward.onUse(player, item)

    if player:getStorageValue(storageKey) < 1 then

        for _, itemInfo in ipairs(itens) do
            player:addItem(itemInfo.id, 1)
            player:getPosition():sendMagicEffect(CONST_ME_CAKE)
        end
        
        player:setStorageValue(storageKey, 1)

        player:sendTextMessage(MESSAGE_INFO_DESCR, "Aqui está sua recompensa, parabéns!")

    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você já recebeu sua recompensa.")
    end

    return true
end

cqReward:uid(1217)
cqReward:register()
    
