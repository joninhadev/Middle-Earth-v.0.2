local bossDarkness = Action()

local leverStorage = 6181 -- Storage base para contar as alavancas ativadas
local teleportPosition = Position(1126, 1749, 7)  -- Onde o teleport será criado
local teleportToPosition = Position(1051, 1731, 7)  -- Para onde o teleport leva
local teleportItemId = 27715 -- ID do teleport
local totalLevers = 3
local teleportDuration = 300 -- Tempo que o teleport ficará ativo (5 minutos)
local resetLeversTime = 600 -- Tempo para resetar alavancas e expulsar jogadores (15 minutos após o teleport fechar)
local bossArea = {fromPos = Position(1051, 1716, 7), toPos = Position(1079, 1746, 7)}
local bossCooldownStorage = 8226 -- Storage para cooldown de 20 horas
local bossCooldownTime = 20 * 60 * 60 -- 20 horas em segundos
local bossName = "Alptramun"
local bossSpawnPosition = Position(1071, 1731, 7)

-- **Posições das alavancas**
local leverPositions = {
    Position(1140, 1843, 5),
    Position(1156, 1715, 7),
    Position(1153, 1709, 9)
}

-- **Função para resetar as alavancas para ID 9825**
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

function bossDarkness.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local storageValue = Game.getStorageValue(leverStorage)
    if storageValue == -1 then
        storageValue = 0
    end

    -- **Transforma a alavanca 9825 em 9826 ao puxar**
    if item:getId() == 9825 then
        item:transform(9826)
    else
        player:sendCancelMessage("Esta alavanca já foi movida.")
        return true
    end

    storageValue = storageValue + 1
    Game.setStorageValue(leverStorage, storageValue)

    if storageValue == totalLevers then
        local teleport = Game.createItem(teleportItemId, 1, teleportPosition)
        
        if teleport then
            teleport:setActionId(9884) -- **Vincula o teleport ao MoveEvent**
            Game.broadcastMessage("As três alavancas foram movidas, Alptramun foi despertado!", MESSAGE_EVENT_ADVANCE)

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
                    -- **Remove jogadores da área do boss**
                    for x = bossArea.fromPos.x, bossArea.toPos.x do
                        for y = bossArea.fromPos.y, bossArea.toPos.y do
                            local pos = Position(x, y, bossArea.fromPos.z)
                            local creature = Tile(pos):getTopCreature()
                            if creature and creature:isPlayer() then
                                creature:teleportTo(teleportPosition)
                                creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "O tempo acabou, você foi removido da sala.")
                            end
                        end
                    end

                    -- AQUI REMOVE O BOSS, CASO ELE ESTEJA VIVO.
                    local boss = Tile(bossSpawnPosition):getTopCreature()
                    if boss and boss:getName():lower() == bossName:lower() then
                        boss:remove()
                        Game.broadcastMessage("Alptramun voltou para as trevas!", MESSAGE_EVENT_ADVANCE)
                    end

                    -- RESETA AS ALAVANCAS
                    resetLevers()

                end, resetLeversTime * 1000)

            end, teleportDuration * 1000)
        end
    else
        local remainingLevers = totalLevers - storageValue
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você moveu uma alavanca! Resta" .. (remainingLevers == 1 and "" or "m") .. " " .. remainingLevers .. " alavanca" .. (remainingLevers == 1 and "" or "s") .. ".")
    end

    return true
end

bossDarkness:aid(9832)
bossDarkness:aid(9833)
bossDarkness:aid(9834)
bossDarkness:register()

-- **Verificação de entrada no teleport**
local tpDarkness = MoveEvent()

function tpDarkness.onStepIn(player, item, position, fromPosition)
    local currentTime = os.time()
    local cooldownEnd = player:getStorageValue(bossCooldownStorage)

    -- Se o jogador já tem cooldown, bloqueia a entrada
    if player:getLevel() >= 200 then
        if cooldownEnd > currentTime then
            local remainingTime = cooldownEnd - currentTime
            local hours = math.floor(remainingTime / 3600)
            local minutes = math.floor((remainingTime % 3600) / 60)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa esperar " .. hours .. " horas e " .. minutes .. " minutos para entrar novamente.")
            player:teleportTo(fromPosition, true)
            return true
        end
    else
        player:teleportTo(fromPosition)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa ser level 250 ou mais para entrar no teleport.")
        return true
    end

    -- **Define a storage de cooldown corretamente**
    player:setStorageValue(bossCooldownStorage, currentTime + bossCooldownTime)
    --player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você entrou no teleport e recebeu um tempo de espera de 20 horas para voltar.")
    player:teleportTo(teleportToPosition, true)
    return true
end

tpDarkness:aid(9884) 
tpDarkness:register()
