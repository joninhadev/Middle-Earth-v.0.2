local potions = {
    effect = CONST_ME_MAGIC_BLUE,
    removePotions = true,
    addEmptyFlasks = true,
    words = "Aaaah...",
    healthRate = 1,
    manaRate = 1,
    stringOfVocation = "Esta potion só pode ser consumida por %s de level %d ou mais",

    [8473] = {vocations = {4, 8}, minLevel = 130, health = {650, 850}, emptyFlask = 7635}, -- Ultimate Health Potion
    [7591] = {vocations = {4, 8}, minLevel = 80, health = {425, 575}, emptyFlask = 7635}, -- Great Health Potion
    [8472] = {vocations = {9, 10, 11, 12}, minLevel = 80, health = {280, 400}, mana = {380, 400}, emptyFlask = 0}, -- Great Spirit Potion
    [7588] = {vocations = {3, 4, 7, 8}, minLevel = 50, health = {250, 350}, emptyFlask = 7634}, -- Strong Health Potion
    [7618] = {health = {125, 175}, emptyFlask = 7636}, -- Health Potion
    [26029] = {vocations = {4, 8}, minLevel = 300, mana = {790, 890}, emptyFlask = 0}, -- Ultimate Great Mana Potion
    [7590] = {vocations = {2, 3, 4, 6, 7, 8}, minLevel = 80, mana = {690, 750}, emptyFlask = 0}, -- Great Mana Potion
    [7589] = {vocations = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 35, 36, 37, 38, 39}, minLevel = 40, mana = {380, 430}, emptyFlask = 0}, -- Strong Mana Potion
    [7620] = {mana = {230, 310}, emptyFlask = 0}, -- Mana Potion
    [8704] = {health = {60, 90}, emptyFlask = 7636}, -- Small Health Potion
}

-- Antidote potion (Cura veneno)
local antidote = Combat()
antidote:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
antidote:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
antidote:setParameter(COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
antidote:setParameter(COMBAT_PARAM_AGGRESSIVE, false)
antidote:setParameter(COMBAT_PARAM_DISPEL, CONDITION_POISON)
potions[8474] = {combat = antidote, emptyFlask = 7636}

-- Exaustão para potions
potions.exhaust = Condition(CONDITION_EXHAUST_HEAL)
potions.exhaust:setParameter(CONDITION_PARAM_TICKS, configManager.getNumber(configKeys.EX_ACTIONS_DELAY_INTERVAL) + 100)

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or not target:isPlayer() then return false end

    local potion = potions[item:getId()]
    if not potion then return false end

    -- Verificação de vocação e nível
    if (potion.vocations or potion.minLevel) and not player:hasFlag(PlayerFlag_IgnoreSpellCheck) then
        local playerVocation = player:getVocation():getId()
        potion.minLevel = potion.minLevel or 1

        if not potion.vocations then
            potion.vocations = {playerVocation}
        end

        if not table.contains(potion.vocations, playerVocation) or player:getLevel() < potion.minLevel then
            local vocations = {}
            for _, vocId in ipairs(potion.vocations) do
                local voc = Vocation(vocId)
                if not voc:getDemotion() then
                    table.insert(vocations, voc:getName():lower() .. "s")
                end
            end
            local vocationString = #vocations > 0 and table.concat(vocations, ", ") or "players"
            player:say(string.format(potions.stringOfVocation, vocationString, potion.minLevel), TALKTYPE_MONSTER_SAY)
            return false
        end
    end

    -- Verificação de exaustão
    if player:getCondition(CONDITION_EXHAUST_HEAL) then
        player:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_YOUAREEXHAUSTED))
        return false
    end

    -- Aplicação de cura/mana
    if potion.health then
        doTargetCombatHealth(0, target, COMBAT_HEALING, potion.health[1] * potions.healthRate, potion.health[2] * potions.healthRate, potions.effect)
    end
    if potion.mana then
        doTargetCombatMana(0, target, potion.mana[1] * potions.manaRate, potion.mana[2] * potions.manaRate, potions.effect)
    end

    -- Aplicação de combate/condição especial
    if potion.combat then
        potion.combat:execute(target, numberToVariant(target:getId()))
    end
    if potion.condition and potion.condition:getType() ~= CONDITION_EXHAUST_HEAL then
        player:addCondition(potion.condition)
    end

    -- Mensagem ao consumir a potion
    target:say(potions.words, TALKTYPE_MONSTER_SAY)

    -- Remoção da potion e adição do frasco vazio
    if potions.removePotions then
        if potions.addEmptyFlasks and potion.emptyFlask then
            if item:getTopParent().uid == player.uid then
                player:addItem(potion.emptyFlask)
            else
                Game.createItem(potion.emptyFlask, 1, item:getPosition())
            end
        end
        item:remove(1)
    end

    -- Aplicação da exaustão
    if not player:hasFlag(PlayerFlag_HasNoExhaustion) then
        player:addCondition(potions.exhaust)
    end

    return true
end
