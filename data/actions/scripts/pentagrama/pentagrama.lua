-- Pentagrama by Brosnon (TFS 1.3 compatível)
-- Reset automático em 15 minutos, 1x por player

local MIN_LEVEL = 150
local STORAGE_REWARD = 5050
local ITEM_KEY = 2086
local BOSS_NAME = "Gothmog"
local RESET_TIME = 15 * 60 -- 15 minutos

local QUEST_ITEM_REWARDS = {
    [5005] = {itemid = 2390, msg = "Você achou a Anduril."},
    [5006] = {itemid = 7413, msg = "Você achou a Dramborleg."},
    [5007] = {itemid = 7415, msg = "Você achou a Grond."},
    [5008] = {itemid = 5803, msg = "Você achou um Executioners Crossbow."}
}

-- Posições dos 5 jogadores
local pentagramPositions = {
    {from = {x=1621, y=854, z=14}, to = {x=1698, y=830, z=14}},
    {from = {x=1622, y=854, z=14}, to = {x=1699, y=830, z=14}},
    {from = {x=1623, y=854, z=14}, to = {x=1700, y=830, z=14}},
    {from = {x=1624, y=854, z=14}, to = {x=1701, y=830, z=14}},
    {from = {x=1625, y=854, z=14}, to = {x=1702, y=830, z=14}},
}

-- Portão principal
local mainGatePos = {x=1699, y=824, z=13}

-- Alavanca inicial e alavancas durante a quest
local starterLeverPos = {x=1623, y=855, z=14}
local leverPositions = {
    {x=1679, y=833, z=14},
    {x=1686, y=807, z=14},
    {x=1711, y=807, z=14},
    {x=1718, y=833, z=14},
    {x=1698, y=846, z=14}
}

-- Área da quest
local questArea = {
    fromPos = {x=1679, y=800, z=14},
    toPos   = {x=1706, y=856, z=14}
}

-- Função para verificar se a quest está ativa
local function isQuestActive()
    for x = questArea.fromPos.x, questArea.toPos.x do
        for y = questArea.fromPos.y, questArea.toPos.y do
            local pos = {x = x, y = y, z = questArea.fromPos.z, stackpos = 253}
            local tile = getTopCreature(pos)
            if tile.uid > 0 then
                if isPlayer(tile.uid) then
                    return true
                end
                local creatureName = getCreatureName(tile.uid)
                if creatureName == BOSS_NAME then
                    return true
                end
            end
        end
    end
    return false
end

-- Verifica players antes da quest
local function checkPlayers(cid, players)
    for _, p in ipairs(players) do
        if p.uid ~= 0 then
            local lvl = getPlayerLevel(p.uid)
            if lvl < MIN_LEVEL then
                doPlayerSendCancel(cid, "Algum dos jogadores não tem o level mínimo (" .. MIN_LEVEL .. ").")
                return false
            end
            if getPlayerStorageValue(p.uid, STORAGE_REWARD) ~= -1 then
                doPlayerSendCancel(cid, "Algum dos jogadores já completou esta quest e não pode repetir.")
                return false
            end
        end
    end
    return true
end

-- Teleporta e consome chaves
local function teleportAndConsume(players)
    for i, p in ipairs(players) do
        if p.itemid > 0 then
            local oldPos, newPos = pentagramPositions[i].from, pentagramPositions[i].to
            doSendMagicEffect(oldPos, CONST_ME_POFF)
            doTeleportThing(p.uid, newPos)
            doSendMagicEffect(newPos, CONST_ME_TELEPORT)
            for _ = 1, 5 do
                doPlayerRemoveItem(p.uid, ITEM_KEY, 1)
            end
        end
    end
end

-- Reset da quest
local function resetQuest()
    -- Remove boss e players
    for x = questArea.fromPos.x, questArea.toPos.x do
        for y = questArea.fromPos.y, questArea.toPos.y do
            local pos = {x=x, y=y, z=questArea.fromPos.z, stackpos=253}
            local tile = getTopCreature(pos)
            if tile.uid > 0 then
                if isPlayer(tile.uid) then
                    doTeleportThing(tile.uid, {x=1620, y=854, z=14})
                    doSendMagicEffect(getThingPos(tile.uid), CONST_ME_TELEPORT)
                    doPlayerSendTextMessage(tile.uid, MESSAGE_STATUS_WARNING, "O tempo acabou e você foi removido da quest.")
                else
                    local creatureName = getCreatureName(tile.uid)
                    if creatureName == BOSS_NAME then
                        doRemoveCreature(tile.uid)
                    end
                end
            end
        end
    end

    -- Reseta alavancas da quest
    for _, pos in ipairs(leverPositions) do
        local lever = getTileItemById(pos, 1946)
        if lever.itemid == 1946 then
            doTransformItem(lever.uid, 1945)
        end
    end

    -- Reseta alavanca inicial
    local starterLever = getTileItemById(starterLeverPos, 1946)
    if starterLever.itemid == 1946 then
        doTransformItem(starterLever.uid, 1945)
    end

    -- Fecha portão
    local gate = getTileItemById(mainGatePos, 5734)
    if gate.itemid > 0 then
        doTransformItem(gate.uid, gate.itemid - 1)
    end
end

-- Função principal
function onUse(cid, item, frompos, item2, topos)
    -- Início da quest
    if item.uid == 1240 then
        if item.itemid == 1945 then
            if isQuestActive() then
                doPlayerSendCancel(cid, "Um grupo entrou recentemente e ainda não foi liberada.")
                return true
            end

            local players = {}
            for _, pos in ipairs(pentagramPositions) do
                table.insert(players, getTopCreature(pos.from))
            end

            if not checkPlayers(cid, players) then
                return true
            end

            teleportAndConsume(players)
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Você borrou suas melhores calças.")
            doSummonCreature(BOSS_NAME, {x=1699, y=840, z=14})
            doTransformItem(item.uid, item.itemid + 1)

            addEvent(resetQuest, RESET_TIME * 1000)

        elseif item.itemid == 1946 then
            if getPlayerAccess(cid) >= 4 then
                doTransformItem(item.uid, item.itemid - 1)
            else
                doPlayerSendCancel(cid,"Um grupo entrou recentemente e ainda nao esta liberada.")
            end
        end
    end

    -- Alavancas internas da quest
    for i, pos in ipairs(leverPositions) do
        local lever = getTileItemById(pos, 1945)
        if item.uid == lever.uid then
            doTransformItem(item.uid, 1946) -- puxa alavanca
            -- checa se todas estão puxadas
            local allPulled = true
            for _, p in ipairs(leverPositions) do
                local l = getTileItemById(p, 1946)
                if l.itemid ~= 1946 then
                    allPulled = false
                    break
                end
            end
            if allPulled then
                local gate = getTileItemById(mainGatePos, 5733)
                if gate.itemid == 5733 then
                    doTransformItem(gate.uid, gate.itemid + 1) -- abre portão
                end
            end
            return true
        end
    end

    -- Recompensas
    if QUEST_ITEM_REWARDS[item.uid] then
        local reward = QUEST_ITEM_REWARDS[item.uid]
        if getPlayerStorageValue(cid, STORAGE_REWARD) == -1 then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, reward.msg)
            doPlayerAddItem(cid, reward.itemid, 1)
            setPlayerStorageValue(cid, STORAGE_REWARD, 1)
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Está vazia.")
        end
    end

    return true
end
