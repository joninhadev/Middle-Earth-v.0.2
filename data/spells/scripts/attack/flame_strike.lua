local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)
function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-0.34 + maglv*-0.34) * 1.8 - 12)
local formula_max = ((lv*-0.44 + maglv*-0.44) * 1.8 - 16)
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