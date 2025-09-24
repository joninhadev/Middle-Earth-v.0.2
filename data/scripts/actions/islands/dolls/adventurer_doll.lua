local adventurerDoll = Action()

local storageAdventurer = 35705

function adventurerDoll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(storageAdventurer) < 1 then
		player:setStorageValue(storageAdventurer, 1)
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Você obteve acesso a Adventurer Island!")
		item:remove(1)
	return true
	end
end

adventurerDoll:id(42451)
adventurerDoll:register()