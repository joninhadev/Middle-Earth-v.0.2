local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLICE)
function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-0.38 + maglv*-0.38) * 1.8 - 12)
local formula_max = ((lv*-0.48 + maglv*-0.48) * 1.8 - 14)
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
