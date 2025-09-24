local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.3, -100, -0.4, -140)

local area = createCombatArea(AREA_CIRCLE2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
