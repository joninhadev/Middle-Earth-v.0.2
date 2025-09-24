local questRoyalSpear = Action()

local requiredLevel = 50
local storageQuest = 737878

function questRoyalSpear.onUse(player, item)

	if player:getLevel() >= 50 then
		if player:getStorageValue(storageQuest) < 1 then
			player:addItem(7378,1)
			player:sendTextMessage(19, "Você encontrou uma royal spear.")
			player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
			player:setStorageValue(storageQuest, 1)
		else
			player:sendTextMessage(19, "Não tem mais nada aqui.")
		end
	else
		player:sendTextMessage(19, "Você precisa ser level 50 ou mais para fazer esta quest.")
	end
	
end
	
questRoyalSpear:aid(3739)
questRoyalSpear:register()