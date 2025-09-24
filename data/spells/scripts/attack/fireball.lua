local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREATTACK)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

-- Fórmula de dano
function getCombatFormulas(cid, lv, maglv)
    local formula_min = ((lv*0.35 + maglv*0.4) * 1.8 + 10)
    local formula_max = ((lv*0.45 + maglv*0.45) * 1.8 + 12)
    
    if formula_max < formula_min then
        local tmp = formula_max
        formula_max = formula_min
        formula_min = tmp
    end
    return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

-- Área de 3x3
local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

-- Lançamento da spell
function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end
