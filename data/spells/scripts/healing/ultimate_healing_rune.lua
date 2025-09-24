local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, TRUE)

function getCombatFormulas(cid, lv, maglv)
    local vocation = getPlayerVocation(cid)

    -- Se for vocação de 13 até 26 usa a primeira fórmula
    if vocation >= 13 and vocation <= 26 then
        local formula_min = ((lv * 2.2 + maglv * 1.6) * 1.9 + 280)
        local formula_max = ((lv * 2.4 + maglv * 1.9) * 1.9 + 300)
        return formula_min, formula_max
    else
        -- Senão usa a segunda fórmula
        local formula_min = ((lv * 1.0 + maglv * 0.5) * 1.9 + 80)
        local formula_max = ((lv * 1.2 + maglv * 0.9) * 1.9 + 80)
        return formula_min, formula_max
    end
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

function onCastSpell(cid, var)
    local target = variantToNumber(var)
    local casterPosition = getCreaturePosition(cid)
    local targetPosition = getCreaturePosition(target)
    
    -- Verifica se o alvo está adjacente (lado a lado)
    if getDistanceBetween(casterPosition, targetPosition) > 1 then
        doPlayerSendCancel(cid, "You can only use this rune on targets that are next to you.")
        doSendMagicEffect(casterPosition, CONST_ME_POFF)
        return false
    end
    
    return doCombat(cid, combat, var)
end
