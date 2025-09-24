local edorascQ = Action()

local config = {
    positions = {
        {x = 667, y = 151, z = 7}, -- 667, 151, 7
        {x = 668, y = 151, z = 7},
        {x = 669, y = 151, z = 7},
        {x = 670, y = 151, z = 7}
    },
    teleportPositions = {
        {x = 833, y = 286, z = 8}, -- 833, 286, 8
        {x = 834, y = 286, z = 8},
        {x = 835, y = 286, z = 8},
        {x = 836, y = 286, z = 8}
    },
    requiredLevelMin = 45,
    requiredLevelMax = 60,
    storageKey = 5007,
    cooldownStorage = 6003,
    cooldownTime = 1 * 10,
    questArea = {
        fromPosition = {x = 810, y = 106, z = 8}, -- 810, 106, 8
        toPosition = {x = 844, y = 295, z = 8}, -- 844, 295, 8
        expelPosition = {x = 674, y = 151, z = 7} -- 579, 519, 7
    },
    gates = {
        {aid = 2031, pos = Position(821, 263, 8)},
        {aid = 2032, pos = Position(821, 236, 8)},
        {aid = 2033, pos = Position(821, 209, 8)},
        {aid = 2034, pos = Position(821, 182, 8)},
        {aid = 2035, pos = Position(821, 155, 8)},
        {aid = 2036, pos = Position(821, 128, 8)}
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
                if creature:getStorageValue(5008) > 0 then
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
        player:sendTextMessage(MESSAGE_INFO_DESCR, "A quest não pode ser iniciada porque o jogador " .. playerWithStorage:getName() .. " já completou a quest.")
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
                    player:sendTextMessage(MESSAGE_INFO_DESCR, "Algum dos jogadores não está entre os níveis " .. config.requiredLevelMin .. " e " .. config.requiredLevelMax .. ".")
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

edorascQ:uid(1230)
edorascQ:register()


------------------------------------------------ [[ SUMONANDO AS CRIATURAS DAS SALAS ]] -------------------------------------------------------

local spawnMobs = Action()

local mobsAndPositionsByUID = {
    [1231] = {
        mobs = {
            {name = "elite frost giant", pos = Position(817, 267, 8)},
            {name = "elite frost giant", pos = Position(817, 270, 8)},
            {name = "elite frost giant", pos = Position(817, 274, 8)},
            {name = "elite frost giant", pos = Position(825, 268, 8)},
            {name = "elite frost giant", pos = Position(825, 271, 8)},
            {name = "elite frost giant", pos = Position(825, 274, 8)}
        }
    },
    [1232] = {
        mobs = {
            {name = "elite yeti", pos = Position(817, 240, 8)},
            {name = "elite yeti", pos = Position(817, 243, 8)},
            {name = "elite yeti", pos = Position(817, 246, 8)},
            {name = "elite yeti", pos = Position(824, 240, 8)},
            {name = "elite yeti", pos = Position(824, 243, 8)},
            {name = "elite yeti", pos = Position(824, 246, 8)}
        }
    },
    [1233] = {
        mobs = {
            {name = "elite ice witch", pos = Position(818, 213, 8)},
            {name = "elite ice witch", pos = Position(818, 217, 8)},
            {name = "elite ice witch", pos = Position(818, 220, 8)},
            {name = "elite ice witch", pos = Position(825, 213, 8)},
            {name = "elite ice witch", pos = Position(825, 217, 8)},
            {name = "elite ice witch", pos = Position(825, 220, 8)}
        }
    },
    [1234] = {
        mobs = {
            {name = "elite crystal spider", pos = Position(818, 187, 8)},
            {name = "elite crystal spider", pos = Position(818, 190, 8)},
            {name = "elite crystal spider", pos = Position(818, 193, 8)},
            {name = "elite crystal spider", pos = Position(825, 187, 8)},
            {name = "elite crystal spider", pos = Position(825, 190, 8)},
            {name = "elite crystal spider", pos = Position(825, 193, 8)}
        }
    },
    [1235] = {
        mobs = {
            {name = "elite frost dragon", pos = Position(818, 160, 8)},
            {name = "elite frost dragon", pos = Position(818, 164, 8)},
            {name = "elite frost dragon", pos = Position(824, 160, 8)},
            {name = "elite frost dragon", pos = Position(824, 164, 8)}
        }
    },
    [1236] = {
        mobs = {
            {name = "goronwy", pos = Position(821, 138, 8)}
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

spawnMobs:uid(1231, 1232, 1233, 1234, 1235, 1236)
spawnMobs:register()

------------------------------------------------ [[ DANDO A RECOMPENSA AO PLAYER ]] -------------------------------------------------------

local cqReward = Action()

local itens = {
    { name = "crusader helmet", id = 2497},
    { name = "skull helmet", id = 5741},
    { name = "frost razor", id = 7455},
    { name = "crystal coin", id = 2160},
    { name = "crystal coin", id = 2160},
    { name = "crystal coin", id = 2160},
    { name = "griffin shield", id = 2533}
}

local storageKey = 5008

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

cqReward:uid(1237)
cqReward:register()
    
