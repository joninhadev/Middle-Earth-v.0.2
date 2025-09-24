local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 1, 200, 1.5, 200)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end