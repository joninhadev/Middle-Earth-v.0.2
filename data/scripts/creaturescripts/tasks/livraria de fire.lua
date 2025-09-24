local fireLibrary = CreatureEvent("fireLibrary")

local config = {
     ['demon'] = {amount = 1000, storage = 38118, startstorage = 6230, startvalue = 1},
     ['hellhound'] = {amount = 1000, storage = 38119, startstorage = 6230, startvalue = 1},
     ['hellfire fighter'] = {amount = 1000, storage = 38120, startstorage = 6230, startvalue = 1},
     ['spirit of fire'] = {amount = 1000, storage = 38121, startstorage = 6230, startvalue = 1}
}

-- Tabela para armazenar o índice do próximo jogador para cada party
local partyRotation = {}

function fireLibrary.onKill(creature, target)
     if not creature:isPlayer() or not target:isMonster() then
         return true
     end

     -- Verificar se é summon usando getMaster()
     if target:getMaster() and target:getMaster():isPlayer() then
         return true
     end

     local monsterName = target:getName():lower()
     local monster = config[monsterName]
     if not monster then
         return true
     end

     -- Verificar se o player tem acesso à quest
     if creature:getStorageValue(monster.startstorage) < monster.startvalue then
         return true
     end

     -- Obter a party do jogador
     local party = creature:getParty()
     local eligiblePlayers = {}

     if party then
         -- Se está em party, adiciona todos os membros que estão próximos e com acesso
         for _, member in ipairs(party:getMembers()) do
             if getDistanceBetween(creature:getPosition(), member:getPosition()) <= 30 and
                member:getStorageValue(monster.startstorage) >= monster.startvalue and
                member:getStorageValue(monster.storage) < monster.amount then
                 table.insert(eligiblePlayers, member)
             end
         end
         -- Adiciona o líder da party também se não estiver na lista
         local leader = party:getLeader()
         if not table.contains(eligiblePlayers, leader) and
            getDistanceBetween(creature:getPosition(), leader:getPosition()) <= 30 and
            leader:getStorageValue(monster.startstorage) >= monster.startvalue and
            leader:getStorageValue(monster.storage) < monster.amount then
             table.insert(eligiblePlayers, leader)
         end
     else
         -- Jogador solo - sempre adiciona a si mesmo se tiver acesso
         if creature:getStorageValue(monster.storage) < monster.amount then
             table.insert(eligiblePlayers, creature)
         end
     end

     -- Se não há jogadores elegíveis, retorna
     if #eligiblePlayers == 0 then
         return true
     end

     -- Determinar qual jogador receberá o kill (sistema rotativo)
     local partyId = tostring(party and party:getId() or creature:getId())
     
     -- Inicializar ou obter o índice de rotação para esta party
     if not partyRotation[partyId] then
         partyRotation[partyId] = 0
     end
     
     -- Avançar para o próximo jogador na rotação
     partyRotation[partyId] = (partyRotation[partyId] % #eligiblePlayers) + 1
     
     -- Selecionar o jogador baseado no índice de rotação
     local selectedPlayer = eligiblePlayers[partyRotation[partyId]]
     
     -- Atualizar o progresso do jogador selecionado
     local currentStorage = selectedPlayer:getStorageValue(monster.storage)
     if currentStorage < 0 then
         currentStorage = 0
     end

     if currentStorage < monster.amount then
         local newValue = currentStorage + 1
         selectedPlayer:setStorageValue(monster.storage, newValue)
         
         if newValue < monster.amount then
             selectedPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, '[Acesso a livraria de fogo]: '.. newValue ..' de '.. monster.amount ..' '.. monsterName ..'s mortos.')
         else
             selectedPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Congratulations, você matou '.. newValue ..' '.. monsterName ..'s!')
         end
         
         -- Avisar outros membros da party quem recebeu o kill
         if party and #eligiblePlayers > 1 then
             for _, member in ipairs(eligiblePlayers) do
                 if member:getId() ~= selectedPlayer:getId() then
                     member:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'O kill foi contabilizado para '.. selectedPlayer:getName() ..' nesta rodada.')
                 end
             end
         end
     end

     return true
end

fireLibrary:register()