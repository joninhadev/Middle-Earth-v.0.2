local vortexDoll = Action()

local storageVortex = 35710

function vortexDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(storageVortex) < 1 then 
	player:setStorageValue(storageVortex, 1)
	player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve acesso a Vortex Island!")
	item:remove(1)
	return true
	end
end

vortexDoll:id(24331)
vortexDoll:register()