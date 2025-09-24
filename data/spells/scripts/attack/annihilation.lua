local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor, tool)
	local element = 0
	if tool then
		local it = ItemType(tool:getId())
		if it and it:getElementDamage() and it:getElementType() ~= COMBAT_NONE then
			element = it:getElementDamage()
		end
	end

	-- Fórmula igual à segunda skill (dano aleatório)
	local maxWeaponDamage = attack * skill * 0.24
	local physicalDamage = -(math.random(maxWeaponDamage/1, maxWeaponDamage))
	
	local elementalDamage = 0
	if element > 0 then
		local maxElementDamage = element * skill * 0.20
		elementalDamage = -(math.random(maxElementDamage/1, maxElementDamage))
	end

	return physicalDamage, physicalDamage, elementalDamage, elementalDamage
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE_EXTENDED, "onGetFormulaValues")

function onCastSpell(creature, var)
	return combat:execute(creature, var)
end