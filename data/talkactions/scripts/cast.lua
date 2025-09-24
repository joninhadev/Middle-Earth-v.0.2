function onSay(player, words, param)
	
	if param == "off" then
	if player:stopLiveCast(param) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Você parou de transmitir o cast do seu jogo.")
	else
		player:sendCancelMessage("Você não está transmitindo um cast do seu jogo.")
	end
	return false
	end	
	if param == "on" then
		param = nil
	end
	if player:startLiveCast(param) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Você está transmitindo um cast do seu jogo.")
	else
		player:sendCancelMessage("Você já está transmitindo um cast do seu jogo.")
	end
	return false
end