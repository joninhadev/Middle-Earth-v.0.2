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
    local cost = level * 300 -- C�lculo baseado no level * 400 gp

    -- Exibir pre�o das blessings
    if msgcontains(msg, "valor") then
        npcHandler:say("O pre�o da blessing para seu n�vel � de " .. cost .. " gold.", cid)
        return true
    end

    -- Comprar blessings
    if msgcontains(msg, "bless") then
        if player:getStorageValue(ADVENTURERS_BLESSING_LEVEL) > 0 then
            npcHandler:say("Voc� j� possui a Adventurer's Blessing e n�o pode receber novas.", cid)
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
            player:sendCancelMessage("Voc� j� foi aben�oado!")
            return true
        end

        if player:removeMoneyNpc(cost) then
            for i = 1, #blesses do
                player:addBlessing(blesses[i], 1)
            end
            npcHandler:say("Parab�ns, " .. player:getName() .. ", agora voc� tem a ben��o!", cid)
            player:getPosition():sendMagicEffect(50)
        else
            npcHandler:say("Nosso Deus precisa muito de dinheiro, e voc� n�o tem o suficiente! Volte quando tiver " .. cost .. " gold.", cid)
        end
        return true
    end

    return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
