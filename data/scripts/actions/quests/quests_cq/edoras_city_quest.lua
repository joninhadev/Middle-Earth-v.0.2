local edorascQ = Action()

local config = {
    positions = {
        {x = 1057, y = 1132, z = 6},
        {x = 1058, y = 1132, z = 6},
        {x = 1059, y = 1132, z = 6},
        {x = 1060, y = 1132, z = 6}
    },
    teleportPositions = {
        {x = 1126, y = 1291, z = 6},
        {x = 1127, y = 1291, z = 6},
        {x = 1129, y = 1291, z = 6},
        {x = 1130, y = 1291, z = 6}
    },
    requiredLevelMin = 20,
    requiredLevelMax = 35,
    storageKey = 5003,
    cooldownStorage = 6001,
    cooldownTime = 15 * 60,
    questArea = {
        fromPosition = {x = 1104, y = 1118, z = 6},
        toPosition = {x = 1134, y = 1296, z = 6},
        expelPosition = {x = 1059, y = 1130, z = 6}
    },
    gates = {
        {aid = 2001, pos = Position(1114, 1268, 6)},
        {aid = 2002, pos = Position(1114, 1241, 6)},
        {aid = 2003, pos = Position(1114, 1214, 6)},
        {aid = 2004, pos = Position(1114, 1185, 6)},
        {aid = 2005, pos = Position(1114, 1158, 6)},
        {aid = 2006, pos = Position(1114, 1131, 6)}
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
                        creature:sendTextMessage(MESSAGE_STATUS_WARNING, "Vocï¿½ foi expulso da ï¿½rea da quest.")
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
                if creature:getStorageValue(5004) > 0 then
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

edorascQ:uid(1200)
edorascQ:register()


------------------------------------------------ [[ SUMONANDO AS CRIATURAS DAS SALAS ]] -------------------------------------------------------

local spawnMobs = Action()

local mobsAndPositionsByUID = {
    [1201] = {
        mobs = {
            {name = "elite smuggler", pos = Position(1108, 1274, 6)},
            {name = "elite smuggler", pos = Position(1108, 1277, 6)},
            {name = "elite smuggler", pos = Position(1108, 1281, 6)},
            {name = "elite smuggler", pos = Position(1119, 1273, 6)},
            {name = "elite smuggler", pos = Position(1119, 1277, 6)},
            {name = "elite smuggler", pos = Position(1119, 1282, 6)}
        }
    },
    [1202] = {
        mobs = {
            {name = "elite amazon", pos = Position(1109, 1246, 6)},
            {name = "elite amazon", pos = Position(1109, 1250, 6)},
            {name = "elite amazon", pos = Position(1109, 1254, 6)},
            {name = "elite amazon", pos = Position(1119, 1246, 6)},
            {name = "elite amazon", pos = Position(1119, 1250, 6)},
            {name = "elite amazon", pos = Position(1119, 1255, 6)}
        }
    },
    [1203] = {
        mobs = {
            {name = "elite bandit", pos = Position(1109, 1218, 6)},
            {name = "elite bandit", pos = Position(1108, 1223, 6)},
            {name = "elite bandit", pos = Position(1109, 1227, 6)},
            {name = "elite bandit", pos = Position(1119, 1219, 6)},
            {name = "elite bandit", pos = Position(1120, 1223, 6)},
            {name = "elite bandit", pos = Position(1120, 1227, 6)}
        }
    },
    [1204] = {
        mobs = {
            {name = "elite valkyrie", pos = Position(1110, 1190, 6)},
            {name = "elite valkyrie", pos = Position(1109, 1194, 6)},
            {name = "elite valkyrie", pos = Position(1109, 1199, 6)},
            {name = "elite valkyrie", pos = Position(1119, 1190, 6)},
            {name = "elite valkyrie", pos = Position(1120, 1194, 6)},
            {name = "elite valkyrie", pos = Position(1120, 1199, 6)}
        }
    },
    [1205] = {
        mobs = {
            {name = "elite assasin", pos = Position(1109, 1163, 6)},
            {name = "elite assasin", pos = Position(1109, 1167, 6)},
            {name = "elite assasin", pos = Position(1109, 1171, 6)},
            {name = "elite assasin", pos = Position(1119, 1162, 6)},
            {name = "elite assasin", pos = Position(1119, 1167, 6)},
            {name = "elite assasin", pos = Position(1119, 1170, 6)}
        }
    },
    [1206] = {
        mobs = {
            {name = "fingerless butcher", pos = Position(1114, 1141, 6)}
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

spawnMobs:uid(1201, 1202, 1203, 1204, 1205, 1206)
spawnMobs:register()

------------------------------------------------ [[ DANDO A RECOMPENSA AO PLAYER ]] -------------------------------------------------------

local cqReward = Action()

local itens = {
    { name = "elven armor", id = 2505},
    { name = "elven legs", id = 2507},
    { name = "sting", id = 7404},
    { name = "crystal coin", id = 2160},
    { name = "rose shield", id = 2527}
}

local storageKey = 5004

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

cqReward:uid(1207)
cqReward:register()
    
