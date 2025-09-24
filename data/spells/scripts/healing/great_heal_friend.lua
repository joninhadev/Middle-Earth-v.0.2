local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local maxRange = 7 -- Defina o alcance máximo da spell

function onGetFormulaValues(player, level, maglevel)
	local min = (level*2.5) + (maglevel *2.3) * 2.8
	local max = (level*2.5) + (maglevel *2.3) * 2.8
    return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, var)
    local target = Creature(var:getNumber()) -- Obtém o alvo da spell
    if not target then
        creature:sendCancelMessage("Você precisa selecionar um aliado válido.")
        return false
    end

    -- Verifica se o alvo está dentro do range permitido
    if creature:getPosition():getDistance(target:getPosition()) > maxRange then
        creature:sendCancelMessage("Seu aliado está muito longe.")
        return false
    end

    return combat:execute(creature, var)
end
