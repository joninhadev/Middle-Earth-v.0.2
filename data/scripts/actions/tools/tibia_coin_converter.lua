local tcConverter = Action()

function tcConverter.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local points = 1 -- Quantidade de coins que ganhará por moeda.
    db.query("UPDATE `accounts` SET `coins` = `coins` + '" .. points .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você recebeu ".. points .. " tibia coin.")
    item:remove(1)
    return true
end

tcConverter:id(24774)
tcConverter:register()