local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.1, -75, -0.15, -90)

local condition = createConditionObject(CONDITION_FIRE)
addDamageCondition(condition, 3, 3000, -5)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end