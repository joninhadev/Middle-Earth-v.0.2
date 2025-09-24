local mirrorEntrance = Action()

local requiredLevel = 200

local mirrorPosition = Position(1027, 439, 10)

local effect = CONST_ME_TELEPORT


function mirrorEntrance.onUse(player, item, position)

	if player:getLevel() >= requiredLevel then
		player:teleportTo(mirrorPosition)
		player:getPosition():sendMagicEffect(effect)
	else
		player:sendTextMessage(19, "Você precisa ser level " .. requiredLevel .. " ou mais para entrar no espelho.")
	end
	
end


mirrorEntrance:aid(64019)
mirrorEntrance:register()


