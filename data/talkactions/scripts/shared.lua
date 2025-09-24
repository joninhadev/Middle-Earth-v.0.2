

function onSay(player, level)

	player:sendTextMessage(19, "O level máximo que você pode sharear é: " .. math.floor(getPlayerLevel(player) * 1.5) .. " e o level mínimo é: " .. math.floor(getPlayerLevel(player) / 1.5) ..".")
end
