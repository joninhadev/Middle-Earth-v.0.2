local venomDoll = Action()

local storageVenom = 35708

function venomDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(storageVenom) < 1 then 
	player:setStorageValue(storageVenom, 1)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve acesso a Venom Island!")
	item:remove(1)
	return true
	end
end

venomDoll:id(37646)
venomDoll:register()