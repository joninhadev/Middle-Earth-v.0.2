local acessWarDragons = Action()

local oldPos = Position(341, 1278, 8)
local newPos = Position(215, 1085, 8)

function acessWarDragons.onUse(player, item, position)

	if item:getActionId() == 39515 then 
		player:teleportTo(oldPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	elseif item:getActionId() == 3125 then
		player:teleportTo(newPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	
end

acessWarDragons:aid(39515, 3125)
acessWarDragons:register()