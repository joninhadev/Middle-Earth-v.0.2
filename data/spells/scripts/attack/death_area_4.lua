local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.65, -1800, -0.85, -1900)

local area = createCombatArea(AREA_CROSS6X6PLUS)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end