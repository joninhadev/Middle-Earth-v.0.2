local flimsyLostSouls = Action()

local TELEPORT_POSITIONS = {
    [14201] = Position(1822, 1141, 8), 
    [14202] = Position(1568, 1200, 7)   
}

local REQUIRED_LEVEL = 250
local TELEPORT_EFFECT = CONST_ME_TELEPORT

function flimsyLostSouls.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local itemId = item:getActionId()
    local destination = TELEPORT_POSITIONS[itemId]
    
    if not destination then
        return false
    end
    
    if itemActionId == 14201 and player:getLevel() < REQUIRED_LEVEL then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa ser level " .. REQUIRED_LEVEL .. " ou mais.")
        return true
    end
    
    player:teleportTo(destination)
    destination:sendMagicEffect(TELEPORT_EFFECT)
    
    return true
end

flimsyLostSouls:aid(14201, 14202)
flimsyLostSouls:register()