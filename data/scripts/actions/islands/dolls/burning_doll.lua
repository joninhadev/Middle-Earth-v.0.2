local burningDoll = Action()

local storageBurning = 35707

function burningDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(storageBurning) < 1 then 
	player:setStorageValue(storageBurning, 1)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve acesso a Burning Island!")
	item:remove(1)
	return true
	end
end

burningDoll:id(41872)
burningDoll:register()