local teleportMoveEvent = MoveEvent()
local WAITING_ROOM_POSITION = Position(1132, 724, 7) -- Sala de espera
function teleportMoveEvent.onStepIn(player, item, position, fromPosition)
    if not player or not player:isPlayer() then
        return false
    end

    player:teleportTo(WAITING_ROOM_POSITION)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você entrou na sala de espera para a invasão!")
    return true
end

teleportMoveEvent:aid(1396) 
teleportMoveEvent:register()