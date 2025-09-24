local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.05, -26, -0.07, -32)

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
