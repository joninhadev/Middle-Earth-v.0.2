function onSay(player, words, param)
	local position = player:getPosition()
	local tile = Tile(position)
	local house = tile and tile:getHouse()
	if house == nil then
		player:sendCancelMessage("Voce tem que esta dentro da casa.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if house:getOwnerGuid() ~= player:getGuid() then
		player:sendCancelMessage("Essa casa nao pertence a voce.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	house:setOwnerGuid(0)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce abandonou sua casa com sucesso.")
	position:sendMagicEffect(CONST_ME_POFF)
	return false
end
