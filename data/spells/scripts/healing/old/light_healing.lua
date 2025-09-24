local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0.1, 35, 0.15, 50)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end