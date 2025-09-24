local entraceLever = MoveEvent()
local posLeverRoom = Position(2171, 364, 10) -- 867, 1949, 9

function entraceLever.onStepIn(player, item, position, fromPosition)

	if player:getStorageValue(5941) < os.time() then
		player:teleportTo(posLeverRoom)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		player:sendTextMessage(22, "Você ainda está em cooldown da última batalha.")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
end

entraceLever:aid(4921)
entraceLever:register()