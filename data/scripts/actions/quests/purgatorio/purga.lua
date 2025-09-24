local entrarPurga = Action()
local axe = 2386
local fonte = 5739
local pos = {x = 1008, y = 340, z = 7}

function entrarPurga.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == axe and target:getId() == fonte then
        player:teleportTo(pos)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você foi teleportado para o purgatório.")
        return true
    end
    return false
end

entrarPurga:id(2386)
entrarPurga:uid(29769)
entrarPurga:register()