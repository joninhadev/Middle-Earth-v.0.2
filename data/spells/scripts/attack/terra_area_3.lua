local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_PLANTATTACK)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.3, -1400, -0.4, -1600)

local area = createCombatArea(AREA_CROSS6X6)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end