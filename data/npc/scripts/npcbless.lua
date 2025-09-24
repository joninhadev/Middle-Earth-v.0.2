local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if not npcHandler:isFocused(cid) then
        return false
    end

    local player = Player(cid)
    local level = player:getLevel()
    local cost = level * 300 -- Cálculo baseado no level * 400 gp

    -- Exibir preço das blessings
    if msgcontains(msg, "valor") then
        npcHandler:say("O preço da blessing para seu nível é de " .. cost .. " gold.", cid)
        return true
    end

    -- Comprar blessings
    if msgcontains(msg, "bless") then
        if player:getStorageValue(ADVENTURERS_BLESSING_LEVEL) > 0 then
            npcHandler:say("Você já possui a Adventurer's Blessing e não pode receber novas.", cid)
            return true
        end

        local blesses = {2, 3, 4, 5, 6, 7}
        local hasBless = false
        for i = 1, #blesses do
            if player:hasBlessing(blesses[i]) then
                hasBless = true
                break
            end
        end

        if hasBless then
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            player:sendCancelMessage("Você já foi abençoado!")
            return true
        end

        if player:removeMoneyNpc(cost) then
            for i = 1, #blesses do
                player:addBlessing(blesses[i], 1)
            end
            npcHandler:say("Parabéns, " .. player:getName() .. ", agora você tem a benção!", cid)
            player:getPosition():sendMagicEffect(50)
        else
            npcHandler:say("Nosso Deus precisa muito de dinheiro, e você não tem o suficiente! Volte quando tiver " .. cost .. " gold.", cid)
        end
        return true
    end

    return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
