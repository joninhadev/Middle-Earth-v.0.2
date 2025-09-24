local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_BIGCLOUDS)

function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-1.2 + maglv*-1.2) * 1.8 -200)
local formula_max = ((lv*-1.8 + maglv*-1.8) * 1.8 -200)
if(formula_max < formula_min) then
local tmp = formula_max
formula_max = formula_min
formula_min = tmp
end
return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

local area = createCombatArea(AREA_CROSS6X6)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end