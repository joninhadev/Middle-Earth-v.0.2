local fortressLever = Action()

function fortressLever.onUse(player, item, position)

	if item:getUniqueId() == 5010 then
		if player:getLevel() < 50 then
			player:sendCancelMessage("Você não tem level suficiente para mover esta alavanca.")
			return true
		end

		if item:getId() == 1945 then
			doTransformItem(item.uid, item.itemid + 1)
			doRemoveItem(4000)
		elseif item:getId() == 1946 then
			player:sendCancelMessage("Está emperrada.")
		end
	return true
	end
end

fortressLever:uid(5010)
fortressLever:register()
