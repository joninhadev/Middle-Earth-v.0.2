local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

function getCombatFormulas(cid, lv, maglv)
    local vocation = getPlayerVocation(cid)
    local formula_min, formula_max

    if vocation == 1 then
        -- Fórmula para vocações 1, 2 e 3
        formula_min = ((lv * 5.5 + maglv * 0.5) * 1.8 + 1060)
        formula_max = ((lv * 10.0 + maglv * 0.9) * 1.8 + 1060)
    elseif vocation == 27 then
        -- Fórmula para vocações 4 e 5
        formula_min = ((lv * 1.3 + maglv * 1.3) * 1.8 + 300)
        formula_max = ((lv * 1.5 + maglv * 1.5) * 1.8 + 300)
    end

    if formula_max < formula_min then
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
