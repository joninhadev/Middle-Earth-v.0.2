local goRoulette = MoveEvent()
newPos = {x = 107, y = 655, z = 5} -- 797, 1719, 5
oldPos = {x = 1204, y = 754, z = 7} -- Posição (DOL)

function goRoulette.onStepIn(player, item, pos, fromPosition)

    if not player then
        return true
    end
	
	if item:getActionId() == 27723 then
	   player:teleportTo(newPos)
	   player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	elseif item:getActionId() == 27724 then
	   player:teleportTo(oldPos)
	   player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
end

goRoulette:aid(27723, 27724)
goRoulette:register()