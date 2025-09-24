local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()           end

local storage = 6232

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end
     local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

     if msgcontains(msg, "mission") then
         if getPlayerStorageValue(cid, storage) == -1 then
             selfSay("Tenho uma missão para você: matar 1000 warlocks, 1000 wyrms e 1000 elder wyrms. Você aceita?", cid)
             talkState[talkUser] = 1
         elseif getPlayerStorageValue(cid, storage) == 1 then
             selfSay("Você matou 1000 warlocks, 1000 wyrms, 1000 elder wyrms?", cid)
             talkState[talkUser] = 1
         else
             selfSay("Você já provou ser digno, obrigado bravo guerreiro.", cid)
         end
     elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
         if getPlayerStorageValue(cid, storage) == -1 then
             selfSay("Você demonstra coragem, volte quando tiver completado, boa sorte!", cid)
             setPlayerStorageValue(cid, storage, 1)
         else
             if getPlayerStorageValue(cid, 38125) == 1000 and getPlayerStorageValue(cid, 38126) == 1000 and getPlayerStorageValue(cid, 38127) == 1000 then
                 selfSay("Bom trabalho, agora você pode acessar a livraria de energy!", cid)
                 doPlayerAddItem(cid, 2160, 10)
				 setPlayerStorageValue(cid, storage, 2)
             else
                 selfSay("Você não matou todos eles.", cid)
             end
         end
         talkState[talkUser] = 0
     elseif msgcontains(msg, "no") and talkState[talkUser] == 1 then
         selfSay("Ok.", cid)
         talkState[talkUser] = 0
     end
     return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())