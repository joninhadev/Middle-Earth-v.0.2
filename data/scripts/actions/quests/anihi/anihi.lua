local anihilator = Action()

local config = {
    positions = { 
        {x = 1007, y = 622, z = 12}, 
        {x = 1006, y = 622, z = 12},
        {x = 1005, y = 622, z = 12},
        {x = 1004, y = 622, z = 12}
    },
    teleportPositions = { 
        {x = 1007, y = 622, z = 13},
        {x = 1006, y = 622, z = 13},
        {x = 1005, y = 622, z = 13},
        {x = 1004, y = 622, z = 13}
    },
    summonPositions = { 
        {x = 1006, y = 620, z = 13},
        {x = 1004, y = 620, z = 13},
        {x = 1007, y = 624, z = 13},
        {x = 1005, y = 624, z = 13},
        {x = 1008, y = 622, z = 13},
        {x = 1009, y = 622, z = 13}
    },
    levelRequirement = 100, 
    storageKey = 5000, 
    monsters = {"Demon"}, 
    cooldownStorage = 6000, 
    cooldownTime = 10 * 60, 
    questArea = { 
        fromPosition = {x = 1003, y = 616, z = 13}, 
        toPosition = {x = 1022, y = 626, z = 13},
        expelPosition = {x = 1001, y = 622, z = 12}
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

function anihilator.onUse(player, item, fromPosition, target, toPosition)

    if player:getPosition() ~= Position(config.positions[1].x, config.positions[1].y, config.positions[1].z) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa estar na posição correta para puxar a alavanca.")
        return true
    end

    local currentTime = os.time()
    local lastUsed = player:getStorageValue(config.cooldownStorage)

    if lastUsed > 0 and currentTime - lastUsed < config.cooldownTime then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "A alavanca só poderá ser usada novamente em " .. (config.cooldownTime - (currentTime - lastUsed)) .. " segundos.")
        return true
    end

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
                if creature:getLevel() >= config.levelRequirement and creature:getStorageValue(config.storageKey) ~= 1 then
                    table.insert(eligiblePlayers, creature)
                else
                    creature:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa ser level " .. config.levelRequirement .. " ou mais para fazer a anihilator quest.")
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

    for _, pos in ipairs(config.summonPositions) do
        local summonPos = Position(pos.x, pos.y, pos.z)
        Game.createMonster(config.monsters[math.random(#config.monsters)], summonPos)
        summonPos:sendMagicEffect(CONST_ME_TELEPORT)
    end

    player:setStorageValue(config.cooldownStorage, currentTime)
    return true
end

anihilator:uid(1100)
anihilator:register()


local anihiReward = Action()

local storageKey = 5001

function anihiReward.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(storageKey) < 1 then 
        if item.uid == 5001 then
            player:addItem(2400, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve uma magic sword.")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_GREEN)
            player:setStorageValue(storageKey, 1)
        elseif item.uid == 5002 then
            player:addItem(2431, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve um stonecutter axe.")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
            player:setStorageValue(storageKey, 1)
        elseif item.uid == 5003 then 
            player:addItem(2421, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve uma thunder hammer.")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
            player:setStorageValue(storageKey, 1)  
        elseif item.uid == 5004 then 
            player:addItem(5947, 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve um heavy crossbow.")
            player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
            player:setStorageValue(storageKey, 1)         
        end
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você já obteve sua recompensa.")
        return true
    end
    return true
end

anihiReward:uid(5001, 5002, 5003, 5004)
anihiReward:register()
