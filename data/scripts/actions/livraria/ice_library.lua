local livrariaIceAction = Action()

local iceLibrary = 6231

local teleportPositions = {
    [33369] = {pos = Position(2078, 97, 8), needStorage = true},
    [33370] = {pos = Position(2080, 119, 7), needStorage = true},
    [33371] = {pos = Position(2140, 82, 8), needStorage = false},
    [33372] = {pos = Position(2131, 83, 8), needStorage = false},
}

function livrariaIceAction.onUse(player, item, position, fromPosition)
    local config = teleportPositions[item:getActionId()]
    if not config then
        return false
    end

    -- Pr�-requisito de level
    if player:getLevel() < 250 then
        player:sendCancelMessage("Voc� precisa ter level 250 ou mais para entrar aqui.")
        return true
    end

    -- Verifica��o de storage
    if config.needStorage and player:getStorageValue(iceLibrary) <= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� precisa completar a miss�o do Anci�o para entrar na livraria.")
        return true
    end

    player:teleportTo(config.pos)
    config.pos:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

livrariaIceAction:aid(33369, 33370, 33371, 33372)
livrariaIceAction:register()
