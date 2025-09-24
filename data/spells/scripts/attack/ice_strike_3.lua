local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.05, -75, -0.07, -95)

local distanceCombat = createCombatObject()
setCombatParam(distanceCombat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(distanceCombat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(distanceCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)
setCombatFormula(distanceCombat, COMBAT_FORMULA_LEVELMAGIC, -0.05, -75, -0.07, -95)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 4000)
setConditionFormula(condition, -0.12, 0, -0.12, 0)
setCombatCondition(distanceCombat, condition)

function onCastSpell(cid, var)
	if(variantToNumber(var) ~= 0) then
		return doCombat(cid, distanceCombat, var)
	end
	return doCombat(cid, combat, var)
end