function onSay(player, words, param)
	local housePrice = configManager.getNumber(configKeys.HOUSE_PRICE)
	if housePrice == -1 then
		return true
	end
	
	local level = player:getLevel()
	if level < 50 then
	player:sendCancelMessage("Voce precisa ser level 50 para comprar uma casa.")
    return false
	end


	local position = player:getPosition()
	position:getNextPosition(player:getDirection())

	local tile = Tile(position)
	if not tile then
		player:sendCancelMessage("Voce tem que esta olhando para uma porta, para comprar uma casa.")
		return false
	end

	local tile = Tile(position)
	local house = tile and tile:getHouse()
	if not house then
		player:sendCancelMessage("Voce tem que esta olhando para uma porta, para comprar uma casa.")
		return false
	end

	if house:getOwnerGuid() > 0 then
		player:sendCancelMessage("Essa casa ja esta ocupada.")
		return false
	end

	if player:getHouse() then
		player:sendCancelMessage("Voce ja possui uma casa.")
		return false
	end

	local price = house:getTileCount() * housePrice
	if not player:removeMoney(price) then
		player:sendCancelMessage("Voce nao tem dinheiro suficiente.")
		return false
	end

	house:setOwnerGuid(player:getGuid())
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Parabens voce adiquiriu uma casa, coloque o dinheiro no banco para pagar o aluguel.")
	return false
end
