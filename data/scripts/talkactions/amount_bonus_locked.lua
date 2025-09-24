local getCount = TalkAction("/lock")

local storageLock = 53333

function getCount.onSay(player, words, param)

	if player:getStorageValue(storageLock) < 1 then
		player:sendTextMessage(22, "Voc� n�o tem b�nus lockado.")
		elseif player:getStorageValue(storageLock) == 1 then
		player:sendTextMessage(22, "Voc� tem "..player:getStorageValue(storageLock).. " b�nus lockado.")
		elseif player:getStorageValue(storageLock) > 1 then
		player:sendTextMessage(22, "Voc� tem "..player:getStorageValue(storageLock).. " b�nus lockados.")
	end
end
getCount:separator("")
getCount:register()