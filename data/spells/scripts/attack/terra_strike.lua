local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_CARNIPHILA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-0.32 + maglv*-0.32) * 1.8 - 10)
local formula_max = ((lv*-0.42 + maglv*-0.42) * 1.8 - 14)
if(formula_max < formula_min) then
local tmp = formula_max
formula_max = formula_min
formula_min = tmp
end
return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end