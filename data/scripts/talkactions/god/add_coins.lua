local config = {
    addCoinsMessage = "Você recebeu %d tibia coins.",
    playerNotFoundMessage = "O jogador '%s' não foi encontrado ou está offline.",
    coinsAddedMessage = "Foram adicionados %d tibia coins para o jogador '%s'.",
    invalidInputMessage = "Uso: /addcoins nomeDoJogador,quantidade"
}

local talk = TalkAction("/addcoins")

function onAddCoins(player, targetPlayer, coins)
    db.query(string.format("UPDATE accounts SET coins = coins + %d WHERE id = %d", coins, targetPlayer:getAccountId()))
    targetPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format(config.addCoinsMessage, coins))
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format(config.coinsAddedMessage, coins, targetPlayer:getName()))
    
    if not targetPlayer:isInGhostMode() then
        targetPlayer:getPosition():sendMagicEffect(32)
        targetPlayer:say("+" .. coins .. " tibia coins.", TALKTYPE_MONSTER_SAY, false, targetPlayer)
    end
end

function talk.onSay(player, words, param)
    if player:getGroup():getId() ~= 6 then
        --player:sendCancelMessage("Apenas GOD pode usar este comando.")
        return false
    end

    local targetName, coinsStr = param:match("^%s*(.-)%s*,%s*(%d+)%s*$")
    if not targetName or not coinsStr then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.invalidInputMessage)
        return false
    end

    local coins = tonumber(coinsStr)
    if not coins or coins <= 0 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, config.invalidInputMessage)
        return false
    end

    local targetPlayer = Player(targetName)
    if targetPlayer then
        onAddCoins(player, targetPlayer, coins)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format(config.playerNotFoundMessage, targetName))
    end

    return false
end

talk:separator(" ")
talk:register()