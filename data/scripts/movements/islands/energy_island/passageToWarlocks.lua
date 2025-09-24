local passageWarlocks = MoveEvent()

local teleportPositions = {
    [9621] = Position(2199, 1474, 11), 
    [9622] = Position(2162, 1366, 1)  
}

function passageWarlocks.onStepIn(player, item, position)
    local destination = teleportPositions[item:getActionId()]
    if destination then
        player:teleportTo(destination)
        destination:sendMagicEffect(CONST_ME_PURPLEENERGY)
    end
end

passageWarlocks:aid(9621, 9622)
passageWarlocks:register()
