local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_EXPLOSIONAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EXPLOSION)

function getCombatFormulas(cid, lv, maglv)
local formula_min = ((lv*-0.9 + maglv*-1.3) * 1.0 )
local formula_max = ((lv*-1.2 + maglv*-1.4) * 1.1 )
if(formula_max < formula_min) then
local tmp = formula_max
formula_max = formula_min
formula_min = tmp
end
return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

local area = createCombatArea(AREA_CROSS1X1)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end