local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-0.8 + maglv*-2.4) * 1.8)
local formula_max = ((lv*-0.8 + maglv*-2.5) * 1.8)
if(formula_max < formula_min) then
local tmp = formula_max
formula_max = formula_min
formula_min = tmp
end
return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

local condition = createConditionObject(CONDITION_ENERGY)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 5, 3000, -5)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
