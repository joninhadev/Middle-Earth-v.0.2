local getStorage = TalkAction("/getstorage")
local setStorage = TalkAction("/setstorage")

function getStorage.onSay(player, words, param)
    local storageId = tonumber(param)
    if not storageId then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Uso correto: /getstorage <storageID>")
        return false
    end

    local storageValue = player:getStorageValue(storageId)
    if storageValue == -1 then
        storageValue = 0
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O valor da storage " .. storageId .. " é: " .. storageValue)
    return false
end

function setStorage.onSay(player, words, param)
    local storageId = tonumber(param)
    if not storageId then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Uso correto: /setstorage <storageID>")
        return false
    end

    local currentValue = player:getStorageValue(storageId)
    if currentValue == -1 then
        currentValue = 0
    end

    local newValue = currentValue + 1
    player:setStorageValue(storageId, newValue)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você definiu a storage " .. storageId .. " para " .. newValue .. ".")
    return false
end

getStorage:separator(" ")
setStorage:separator(" ")

getStorage:register()
setStorage:register()
