local config = {
    addCoinsMessage = "Você recebeu %d tibia coins.",
    notEnoughCoinsMessage = "Você não tem moedas suficientes.",
    invalidInputMessage = "Uso: /retirar quantidade"
}

local itemId = 24774  -- ID do item Tibia Coins

local talk = TalkAction("/retirar")

function onRemoveCoins(player, coins)
    local accountId = player:getAccountId()
    local resultId = db.storeQuery("SELECT coins FROM accounts WHERE id = " .. accountId)
    if resultId then
        local currentCoins = result.getDataInt(resultId, "coins")
        result.free(resultId)

        if currentCoins < coins then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.notEnoughCoinsMessage)
            return false
        end

        db.query(string.format("UPDATE accounts SET coins = coins - %d WHERE id = %d", coins, accountId))
        player:addItem(itemId, coins)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format(config.addCoinsMessage, coins))

        if not player:isInGhostMode() then
            player:getPosition():sendMagicEffect(32)
            player:say("+" .. coins .. " tibia coins", TALKTYPE_MONSTER_SAY, false, player)
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.invalidInputMessage)
    end
    return false
end

function talk.onSay(player, words, param)

    local coins = tonumber(param)
    if not coins or coins <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.invalidInputMessage)
        return false
    end

    onRemoveCoins(player, coins)
    return false
end

talk:separator(" ")
talk:register()