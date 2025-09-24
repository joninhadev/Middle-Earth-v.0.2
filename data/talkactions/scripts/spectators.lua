function onSay(player, words, param)
	local spectators, anonymous = player:getSpectators()
	if spectators then
		local total = #spectators + anonymous
		local message = "Espectadores: "
		message = message .. table.concat(spectators, ", ") .. " - e " .. anonymous .. " anonimos."
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, message)
	else
		player:sendCancelMessage("Você não está transmitindo um cast do seu jogo.")
	end
	return false
end