local darnkessDoll = Action()

local storageDarkness = 35709

function darnkessDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(storageDarkness) < 1 then 
	player:setStorageValue(storageDarkness, 1)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve acesso a Darkness Island!")
	item:remove(1)
	return true
	end
end

darnkessDoll:id(28310)
darnkessDoll:register()