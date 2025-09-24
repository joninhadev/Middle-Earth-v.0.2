local snowDoll = Action()

local storageSnow = 35706

function snowDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(storageSnow) < 1 then 
	player:setStorageValue(storageSnow, 1)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve acesso a Snow Island!")
	item:remove(1)
	return true
	end
end

snowDoll:id(45150)
snowDoll:register()