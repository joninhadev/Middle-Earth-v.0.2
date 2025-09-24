local livrariaAction = Action()

local fireLibrary = 6230

local teleportPositions = {
    [33365] = {pos = Position(321, 1177, 8), needStorage = true},
    [33366] = {pos = Position(370, 1356, 1), needStorage = true}, 
    [33367] = {pos = Position(384, 1161, 8), needStorage = false},
    [33368] = {pos = Position(373, 1162, 8), needStorage = false}, 
}

function livrariaAction.onUse(player, item, position, fromPosition)
    local config = teleportPositions[item:getActionId()]
    if not config then
        return false
    end

    -- Pré-requisito de level
    if player:getLevel() < 250 then
        player:sendCancelMessage("Você precisa ter level 250 ou mais para entrar aqui.")
        return true
    end

    -- Verificação de storage
    if config.needStorage and player:getStorageValue(fireLibrary) <= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa completar a missão do Ancião para entrar na livraria.")
        return true
    end

    player:teleportTo(config.pos)
    config.pos:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

livrariaAction:aid(33365, 33366, 33367, 33368)
livrariaAction:register()
