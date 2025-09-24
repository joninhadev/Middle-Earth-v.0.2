local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)



function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)

	local maxWeaponDamage = weaponAttack * weaponSkill * 0.125 + 45
	local damage = -((math.random(maxWeaponDamage/2,maxWeaponDamage)))
	
	return damage, damage --The random part of the formula has already been made, just return the normal damage
end

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
