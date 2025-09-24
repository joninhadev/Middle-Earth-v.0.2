local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
--setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ETHEREALSPEAR)

function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
	local skill = getPlayerSkill(cid, 4)
	local ml = getPlayerMagLevel(cid,false)

	local maxWeaponDamage = (skill * 2)+(ml * 4)+80
	local damage = -((math.random(maxWeaponDamage/2,maxWeaponDamage)))

	return damage, damage --The random part of the formula has already been made, just return the normal damage
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
