function onSay(player, words, param)
	
	if param == "off" then
	if player:stopLiveCast(param) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� parou de transmitir o cast do seu jogo.")
	else
		player:sendCancelMessage("Voc� n�o est� transmitindo um cast do seu jogo.")
	end
	return false
	end	
	if param == "on" then
		param = nil
	end
	if player:startLiveCast(param) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� est� transmitindo um cast do seu jogo.")
	else
		player:sendCancelMessage("Voc� j� est� transmitindo um cast do seu jogo.")
	end
	return false
end