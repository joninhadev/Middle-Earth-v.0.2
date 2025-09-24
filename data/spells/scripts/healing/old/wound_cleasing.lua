local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

function getCombatFormulas(cid, lv, maglv)
	-- Formulas completly NOT accurate, and I never testes this spell. Please, someone send me an accurate formula
	-- Pedro B. at OTFans.net
	local formula_min = ((lv*4 + maglv*2) * 0.55) + 20
	local formula_max = ((lv*4 + maglv*2) * 0.95) + 20

	return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end