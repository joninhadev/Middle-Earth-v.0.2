

function onSay(player, level)

	player:sendTextMessage(19, "O level m�ximo que voc� pode sharear �: " .. math.floor(getPlayerLevel(player) * 1.5) .. " e o level m�nimo �: " .. math.floor(getPlayerLevel(player) / 1.5) ..".")
end
