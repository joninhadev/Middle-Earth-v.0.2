local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local tabela = {35, 36, 37, 38, 39}
local c = 0

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	
	
	
	if (msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') or msgcontains(msg, 'promover'))  then
		for x=1,#tabela do
			if getPlayerVocation(cid) == tabela[x] then
				if getPlayerLevel(cid) >= 30 then
					if (getPlayerVocation(cid) == 35) then
						npcHandler:say('Voce quer ser promovido para Elf Ranger por 5.000gp?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerVocation(cid) == 36) and getPlayerLevel(cid) >= 60 then
						npcHandler:say('Voce quer ser promovido para Elf Sentinel por 10.000gp?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerVocation(cid) == 37) and getPlayerLevel(cid) >= 90 then
						npcHandler:say('Voce quer ser promovido para High Elf por 20.000gp?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerVocation(cid) == 38) and getPlayerLevel(cid) >= 150 then
						npcHandler:say('Voce quer ser promovido para Elven Elite por 50.000gp?', cid)
						talkState[talkUser] = 1
					
					elseif (getPlayerVocation(cid) == 39) then
						npcHandler:say('Voce ja esta na ultima promocao', cid)
						
					else
						npcHandler:say('Você não tem level suficiente para se promover.', cid)
					end
				else
					npcHandler:say('Me desculpe, mas eu só posso promover quando estiver level 30.', cid)
				end
				c = 1
				break
			end
		end
		if c == 0 then
			npcHandler:say("Voce tem que ser um Elder Druid para ser promovido aqui.", cid)
		end
		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerVocation(cid) == 35) then
			if(not doPlayerRemoveMoney(cid, 5000)) then
				npcHandler:say('Desculpe, mas voce nao tem dinheiro suficiente.', cid)
			else
				 doPlayerSetVocation(cid, 36)
				npcHandler:say('Voce foi promovido!', cid)
			end
			talkState[talkUser] = 0
			
		elseif(getPlayerVocation(cid) == 36) then
				if(not doPlayerRemoveMoney(cid, 10000)) then
					npcHandler:say('Desculpe, mas voce nao tem dinheiro suficiente.', cid)
				else
					 doPlayerSetVocation(cid, 37)
				    npcHandler:say('Voce foi promovido!', cid)
				end
			talkState[talkUser] = 0
			
		elseif(getPlayerVocation(cid) == 37) then
				if(not doPlayerRemoveMoney(cid, 20000)) then
					npcHandler:say('Desculpe, mas voce nao tem dinheiro suficiente.', cid)
				else
					 doPlayerSetVocation(cid, 38)
				    npcHandler:say('Voce foi promovido!', cid)
				end
			talkState[talkUser] = 0
		
		elseif(getPlayerVocation(cid) == 38) then
			if isPremium(cid) then
				if(not doPlayerRemoveMoney(cid, 50000)) then
					npcHandler:say('Desculpe, mas voce nao tem dinheiro suficiente.', cid)
				else
					 doPlayerSetVocation(cid, 39)
				    npcHandler:say('Voce foi promovido!', cid)
				end
			else
				npcHandler:say("Voce tem que ter uma conta VIP para se tornar um Elven Elite!", cid)
			end
			talkState[talkUser] = 0
			
		end
	
	elseif(msgcontains(msg, 'no')) then
		npcHandler:say('Ate mais, volte quando estiver preparado.', cid)
		talkState[talkUser] = 0
		
	end

	return true
end

function msgcontains(message, keyword)
	if(type(keyword) == "table") then
		return table.isStrIn(keyword, message)
	end

	local a, b = message:lower():find(keyword:lower())
	if(a ~= nil and b ~= nil) then
		return true
	end

	return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
