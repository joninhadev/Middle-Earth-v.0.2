local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-0.40 + maglv*-3.0) * 1.5 - 120)
local formula_max = ((lv*-0.50 + maglv*-3.0) * 1.6 - 160)
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
