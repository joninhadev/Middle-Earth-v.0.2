local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 10000) -- duração em ms
condition:setParameter(CONDITION_PARAM_SUBID, 57) -- ID único
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true) -- debuff
condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 60)

-- adiciona o ícone
condition:setParameter(CONDITION_PARAM_ICON, ICON_SHIELD) -- exemplo: ícone de espadas cruzadas

combat:setCondition(condition)

function onCastSpell(creature, var)
    return combat:execute(creature, var)
end
