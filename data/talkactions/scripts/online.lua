function onSay(player, words, param)
	local players = Game.getPlayers()
	local playerCount = Game.getPlayerCount()

	player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, (playerCount).. " players online.")


end
