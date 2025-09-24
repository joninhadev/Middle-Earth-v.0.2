local saidaBoss = MoveEvent()


local saidaPos = Position(2080, 121, 7)

function saidaBoss.onStepIn(player, item, position)

	player:teleportTo(saidaPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

end

saidaBoss:aid(2080)
saidaBoss:register()