local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, true)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
--setCombatParam(combat, COMBAT_PARAM_USECHARGES, true)

function onGetFormulaValues(cid, level, skill, attack, factor)
	local dmg
	dmg = (attack * skill * 0.1) + 150
	
	return -(dmg/3), -(dmg)
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
