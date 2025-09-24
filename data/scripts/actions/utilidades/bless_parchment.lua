local mysticbless = Action()

local blesses = {2,3,4,5,6,7,8}

function mysticbless.onUse(player, item)

	local hasBless = false
	for i = 1, #blesses do
		if player:hasBlessing(blesses[i]) then
			hasBless = true
			break
		end
	end
	
	if hasBless then
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendTextMessage(19, "Você já tem todas as blessings.")
	else
		for i = 1, #blesses do
			player:addBlessing(blesses[i], 1)
		end
		player:sendTextMessage(22, "Você adquiriu todas as blessings.")
		player:getPosition():sendMagicEffect(50)
		item:remove(1)
	end
end

mysticbless:id(57445)
mysticbless:register()
