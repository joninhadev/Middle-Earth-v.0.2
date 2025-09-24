local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-0.2 + maglv*-0.4) * 1.8 -620)
local formula_max = ((lv*-0.3 + maglv*-0.7) * 1.8 -650)
if(formula_max < formula_min) then
local tmp = formula_max
formula_max = formula_min
formula_min = tmp
end
return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

local area = createCombatArea(AREA_WAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
