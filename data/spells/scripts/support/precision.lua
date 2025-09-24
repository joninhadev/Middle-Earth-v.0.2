local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STONES)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

-- Condição de aumento de skill de distância e chance de crítico
local condition = createConditionObject(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 10)
condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, 100)
condition:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, 5)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, 20) -- Aumento de skill
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000) -- Duração de 10 segundos
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

setCombatCondition(combat, condition)

-- Fórmula de dano
function onGetFormulaValues(player, skill, attack, factor)
    local min = (player:getLevel() / 5) + (skill * attack * 0.02) + 4
    local max = (player:getLevel() / 5) + (skill * attack * 0.04) + 9
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

-- Função para lançar o feitiço
function onCastSpell(creature, variant)
    -- Guarda o outfit atual e define o novo
    local prevOutfit = creature:getOutfit()
    local newOutfit = { lookType = 1594 }
    creature:setOutfit(newOutfit)

    -- Restaura o outfit após 10 segundos
    addEvent(function(cid, prev)
        local creature = Creature(cid)
        if not creature then
            return
        end
        creature:setOutfit(prev)
    end, 20000, creature:getId(), prevOutfit)

    -- Efeito visual
    creature:getPosition():sendMagicEffect(180)

    -- Executa o combate (mesmo sendo uma magia não agressiva)
    return combat:execute(creature, variant)
end
