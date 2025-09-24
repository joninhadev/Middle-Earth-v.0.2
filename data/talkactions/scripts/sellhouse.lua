function onSay(player, words, param)
	local tradePartner = Player(param)
	if not tradePartner or tradePartner == player then
		player:sendCancelMessage("Nenhum jogador encontrado.")
		return false
	end

	local house = player:getTile():getHouse()
	if not house then
		player:sendCancelMessage("Você deve ficar em sua casa para iniciar um trade.")
		return false
	end

	local returnValue = house:startTrade(player, tradePartner)
	if returnValue ~= RETURNVALUE_NOERROR then
		player:sendCancelMessage(returnValue)
	end
	return false
end