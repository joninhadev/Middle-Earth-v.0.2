local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*0.1 + maglv*0.1) * 1.8 + 35)
local formula_max = ((lv*0.15 + maglv*0.15) * 1.8 + 50)
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