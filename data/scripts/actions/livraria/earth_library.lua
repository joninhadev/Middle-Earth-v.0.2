local livrariaEarthAction = Action()

local earthLibrary = 6233

local teleportPositions = {
    [33377] = {pos = Position(899, 1727, 8), needStorage = true},
    [33378] = {pos = Position(940, 1740, 8), needStorage = true},
    [33379] = {pos = Position(961, 1712, 8), needStorage = false},
    [33380] = {pos = Position(952, 1713, 8), needStorage = false},
}

function livrariaEarthAction.onUse(player, item, position, fromPosition)
    local config = teleportPositions[item:getActionId()]
    if not config then
        return false
    end

    if config.needStorage and player:getStorageValue(earthLibrary) <= 1 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa completar a missão do Ancião para entrar na livraria.")
        return true
    end

    player:teleportTo(config.pos)
    config.pos:sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

livrariaEarthAction:aid(33377, 33378, 33379, 33380)
livrariaEarthAction:register()
