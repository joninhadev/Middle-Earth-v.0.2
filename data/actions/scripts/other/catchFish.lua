function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.itemid ~= 5554 then
		return false
	end

	if math.random(100) ~= 1 then
		player:say("O peixe dourado escapou.", TALKTYPE_MONSTER_SAY)
		return true
	end

	player:say("O peixe dourado foi capturado.", TALKTYPE_MONSTER_SAY)
	item:transform(8766)
	toPosition:sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end
