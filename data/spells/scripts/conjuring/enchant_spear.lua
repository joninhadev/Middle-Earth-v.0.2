function onCastSpell(creature, variant)
	if creature:getItemCount(2389) >= 1 then
	creature:removeItem(2389, 1)
	creature:addItem(7367, 1)
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)	
	else
	creature:sendCancelMessage("Você precisa de uma Spear para encanta-lá.")
	end
end
