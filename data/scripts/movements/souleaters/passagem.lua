local tpHunt = MoveEvent()

local requiredLevel = 220
local nextPos = Position(106, 233, 2)
local oldPos = Position(462, 997, 1)
local startHunt = Position(106, 233, 2)

function tpHunt.onStepIn(player, item, position, fromPosition)
	
	if item:getActionId() == 27715 then
		if player:getLevel() >= requiredLevel then
			player:teleportTo(nextPos)
			player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		else 
			player:sendTextMessage(19, "Você precisa ser level 220 ou mais para entrar nesse portal.")
		end
	elseif item:getActionId() == 27716 then
		player:teleportTo(oldPos)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	elseif item:getActionId() == 27717 then
		player:teleportTo(startHunt)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end

end

tpHunt:aid(27715, 27716, 27717)
tpHunt:register()