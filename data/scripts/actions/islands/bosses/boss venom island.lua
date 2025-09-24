local bossVenom = Action()

local leverStorage = 6179 -- Storage base para contar as alavancas ativadas
local teleportPosition = Position(958, 1645, 5)  -- Onde o teleport ser� criado
local teleportToPosition = Position(1018, 1639, 8)  -- Para onde o teleport leva
local teleportItemId = 27717 -- ID do teleport
local totalLevers = 3
local teleportDuration = 300 -- Tempo que o teleport ficar� ativo (5 minutos)
local resetLeversTime = 600 -- Tempo para resetar alavancas e expulsar jogadores (15 minutos ap�s o teleport fechar)
local bossArea = {fromPos = Position(999, 1627, 8), toPos = Position(1019, 1650, 8)}
local bossCooldownStorage = 8224 -- Storage para cooldown de 20 horas
local bossCooldownTime = 20 * 60 * 60 -- 20 horas em segundos
local bossName = "Yselda"
local bossSpawnPosition = Position(1003, 1639, 8)

-- **Posi��es das alavancas**
local leverPositions = {
    Position(844, 1680, 8),
    Position(975, 1631, 8),
    Position(960, 1642, 6)
}

-- **Fun��o para resetar as alavancas para ID 9825**
local function resetLevers()
    for _, leverPos in ipairs(leverPositions) do
        local leverTile = Tile(leverPos)
        if leverTile then
            local leverItem = leverTile:getItemById(9826)
            if leverItem then
                leverItem:transform(9825) -- **Transforma de volta para 9825**
            end
        end
    end
    -- **Reseta a storage global**
    Game.setStorageValue(leverStorage, 0)
    --Game.broadcastMessage("As alavancas podem ser ativadas novamente!", MESSAGE_EVENT_ADVANCE)
end

function bossVenom.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local storageValue = Game.getStorageValue(leverStorage)
    if storageValue == -1 then
        storageValue = 0
    end

    -- **Transforma a alavanca 9825 em 9826 ao puxar**
    if item:getId() == 9825 then
        item:transform(9826)
    else
        player:sendCancelMessage("Esta alavanca j� foi movida.")
        return true
    end

    storageValue = storageValue + 1
    Game.setStorageValue(leverStorage, storageValue)

    if storageValue == totalLevers then
        local teleport = Game.createItem(teleportItemId, 1, teleportPosition)
        
        if teleport then
            teleport:setActionId(9882) -- **Vincula o teleport ao MoveEvent**
            Game.broadcastMessage("As tr�s alavancas foram movidas, Yselda foi despertado!", MESSAGE_EVENT_ADVANCE)

            -- **Summona o boss "Lokathmor"**
            Game.createMonster(bossName, bossSpawnPosition)

            addEvent(function()
                local teleportItem = Tile(teleportPosition):getItemById(teleportItemId)
                if teleportItem then
                    teleportItem:remove()
                    Game.broadcastMessage("O tempo para entrar no teleport foi esgotado.", MESSAGE_EVENT_ADVANCE)
                end

                -- **15 MINUTOS PARA EXPULSAR OS JOGADORES E RESETAR AS ALAVANCAS**
                addEvent(function()
                    -- **Remove jogadores da �rea do boss**
                    for x = bossArea.fromPos.x, bossArea.toPos.x do
                        for y = bossArea.fromPos.y, bossArea.toPos.y do
                            local pos = Position(x, y, bossArea.fromPos.z)
                            local creature = Tile(pos):getTopCreature()
                            if creature and creature:isPlayer() then
                                creature:teleportTo(teleportPosition)
                                creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O tempo acabou, voc� foi removido da sala.")
                            end
                        end
                    end

                    -- AQUI REMOVE O BOSS, CASO ELE ESTEJA VIVO.
                    local boss = Tile(bossSpawnPosition):getTopCreature()
                    if boss and boss:getName():lower() == bossName:lower() then
                        boss:remove()
                        Game.broadcastMessage("Yselda voltou para as trevas!", MESSAGE_EVENT_ADVANCE)
                    end

                    -- RESETA AS ALAVANCAS
                    resetLevers()

                end, resetLeversTime * 1000)

            end, teleportDuration * 1000)
        end
    else
        local remainingLevers = totalLevers - storageValue
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� moveu uma alavanca! Resta" .. (remainingLevers == 1 and "" or "m") .. " " .. remainingLevers .. " alavanca" .. (remainingLevers == 1 and "" or "s") .. ".")
    end

    return true
end

bossVenom:aid(9826)
bossVenom:aid(9827)
bossVenom:aid(9828)
bossVenom:register()

-- **Verifica��o de entrada no teleport**
local tpVenom = MoveEvent()

function tpVenom.onStepIn(player, item, position, fromPosition)
    local currentTime = os.time()
    local cooldownEnd = player:getStorageValue(bossCooldownStorage)

    -- Se o jogador j� tem cooldown, bloqueia a entrada
    if player:getLevel() >= 200 then
        if cooldownEnd > currentTime then
            local remainingTime = cooldownEnd - currentTime
            local hours = math.floor(remainingTime / 3600)
            local minutes = math.floor((remainingTime % 3600) / 60)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� precisa esperar " .. hours .. " horas e " .. minutes .. " minutos para entrar novamente.")
            player:teleportTo(fromPosition, true)
            return true
        end
    else
        player:teleportTo(fromPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� precisa ser level 250 ou mais para entrar no teleport.")
        return true
    end

    -- **Define a storage de cooldown corretamente**
    player:setStorageValue(bossCooldownStorage, currentTime + bossCooldownTime)
    --player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� entrou no teleport e recebeu um tempo de espera de 20 horas para voltar.")
    player:teleportTo(teleportToPosition, true)
    return true
end

tpVenom:aid(9882) 
tpVenom:register()
