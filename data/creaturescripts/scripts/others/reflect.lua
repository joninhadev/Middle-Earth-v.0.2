local monsters = {
	-- Carnivors
	["menacing carnivor"] = {type = COMBAT_PHYSICALDAMAGE, value = 0.5}, -- nome em minúsculo, tipo de dano, valor refletido em %
	["spiky carnivor"] = {type = COMBAT_PHYSICALDAMAGE, value = 0.5},
	["lumbering carnivor"] = {type = COMBAT_PHYSICALDAMAGE, value = 0.5},
}

function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	local monster = monsters[creature:getName():lower()]
	if not monster or not attacker then 
		return primaryDamage, primaryType, secondaryDamage, secondaryType
	end

	if creature and (attacker:isPlayer() or attacker:getMaster()) then
		if primaryType == monster.type then
			local newDamage = primaryDamage + (primaryDamage*monster.value)
			doTargetCombat(0, attacker, primaryType, - newDamage, - newDamage, secondaryType, ORIGIN_NONE)
		end
	end
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
