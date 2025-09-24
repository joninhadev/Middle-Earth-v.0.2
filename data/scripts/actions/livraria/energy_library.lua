local livrariaEnergyAction = Action()

local energyLibrary = 6232

local teleportPositions = {
    [33373] = {pos = Position(1907, 1363, 8), needStorage = true},
    [33374] = {pos = Position(2137, 1390, 4), needStorage = true},
    [33375] = {pos = Position(1969, 1348, 8), needStorage = false},
    [33376] = {pos = Position(1960, 1349, 8), needStorage = false},
}

function livrariaEnergyAction.onUse(player, item, position, fromPosition)
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
    if config.needStorage and player:getStorageValue(energyLibrary) <= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa completar a missão do Ancião para entrar na livraria.")
        return true
    end

    player:teleportTo(config.pos)
    config.pos:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

livrariaEnergyAction:aid(33373, 33374, 33375, 33376)
livrariaEnergyAction:register()
