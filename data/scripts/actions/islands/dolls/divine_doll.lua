local divineDoll = Action()

local storageDivine = 35711

function divineDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(storageDivine) < 1 then 
	player:setStorageValue(storageDivine, 1)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve acesso a Divine Island!")
	item:remove(1)
	return true
	end
end

divineDoll:id(45152)
divineDoll:register()