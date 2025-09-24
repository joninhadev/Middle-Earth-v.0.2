local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local maxRange = 7 -- Defina o alcance m�ximo da spell

function onGetFormulaValues(player, level, maglevel)
    local min = (level * 1.9) + (maglevel * 1.9) * 1.8
    local max = (level * 2.2) + (maglevel * 2.2) * 1.8
    return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
    local target = Creature(var:getNumber()) -- Obt�m o alvo da spell
    if not target then
        creature:sendCancelMessage("Voc� precisa selecionar um aliado v�lido.")
        return false
    end

    -- Verifica se o alvo est� dentro do range permitido
    if creature:getPosition():getDistance(target:getPosition()) > maxRange then
        creature:sendCancelMessage("Seu aliado est� muito longe.")
        return false
    end

    return combat:execute(creature, var)
end
