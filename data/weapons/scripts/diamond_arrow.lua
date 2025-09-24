local area = createCombatArea({
    {0, 1, 1, 1, 0},
    {1, 1, 1, 1, 1},
    {1, 1, 3, 1, 1},
    {1, 1, 1, 1, 1},
    {0, 1, 1, 1, 0},
})

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DIAMONDARROW)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)

function onGetFormulaValues(player, skill, attack, factor)
    local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
    local min = (player:getLevel() / 3) + ((((distanceSkill / 2) + 1) * (attack / 2)) * 0.3)
    local max = (player:getLevel() / 3) + ((((distanceSkill / 4) + 1) * (attack / 3)) * 0.6)
    
    -- Verificar se o alvo é um player e reduzir 70% do dano
    local target = player:getTarget()
    if target and target:isPlayer() then
        min = min * 0.7 
        max = max * 0.7 
    end
    
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")
combat:setArea(area)

function onUseWeapon(player, variant)
    if player then
    end
    return combat:execute(player, variant)
end