local toolGear = Action()

function toolGear.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if math.random(100) > 5 then
		return onUseRope(player, item, fromPosition, target, toPosition, isHotkey)
			or onUseShovel(player, item, fromPosition, target, toPosition, isHotkey)
			or onUsePick(player, item, fromPosition, target, toPosition, isHotkey)
			or onUseMachete(player, item, fromPosition, target, toPosition, isHotkey)
			or onUseCrowbar(player, item, fromPosition, target, toPosition, isHotkey)
			or onUseSpoon(player, item, fromPosition, target, toPosition, isHotkey)
			or onUseScythe(player, item, fromPosition, target, toPosition, isHotkey)
			or onUseKitchenKnife(player, item, fromPosition, target, toPosition, isHotkey)
	end
	return true
end

toolGear:id(10511, 10513, 10515)
toolGear:register()