local getCount = TalkAction("/lock")

local storageLock = 53333

function getCount.onSay(player, words, param)

	if player:getStorageValue(storageLock) < 1 then
		player:sendTextMessage(22, "Você não tem bônus lockado.")
		elseif player:getStorageValue(storageLock) == 1 then
		player:sendTextMessage(22, "Você tem "..player:getStorageValue(storageLock).. " bônus lockado.")
		elseif player:getStorageValue(storageLock) > 1 then
		player:sendTextMessage(22, "Você tem "..player:getStorageValue(storageLock).. " bônus lockados.")
	end
end
getCount:separator("")
getCount:register()