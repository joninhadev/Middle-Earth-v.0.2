local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.42, -300, -0.5, -380)

local condition = createConditionObject(CONDITION_FIRE)
addDamageCondition(condition, 4, 3000, -5)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end