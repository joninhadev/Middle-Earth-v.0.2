local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local tabela = {17, 18, 19, 20}
local c = 0

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	
	
	
	if (msgcontains(msg, 'promotion') or msgcontains(msg, 'promote') or msgcontains(msg, 'promover'))  then
		for x=1,#tabela do
			if getPlayerVocation(cid) == tabela[x] then
				if getPlayerLevel(cid) >= 25 then
					if (getPlayerVocation(cid) == 17) then
						npcHandler:say('Voce quer ser promovido para Dwarf Blacksmith por 10.000gp?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerVocation(cid) == 18) and getPlayerLevel(cid) >= 50 then
						npcHandler:say('Voce quer ser promovido para Dwarf Weaponsmith por 20.000gp?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerVocation(cid) == 19) and getPlayerLevel(cid) >= 150 then
						npcHandler:say('Voce quer ser promovido para Dwarf Artisan por 50.000gp?', cid)
						talkState[talkUser] = 1
						
					elseif (getPlayerVocation(cid) == 20) then
						npcHandler:say('Voce ja esta na ultima promocao', cid)
						
					else
						npcHandler:say('Você não tem level suficiente para se promover.', cid)
					end
				else
					npcHandler:say('Me desculpe, mas eu só posso promover quando estiver level 25.', cid)
				end
				c = 1
				break
			end
		end
		if c == 0 then
			npcHandler:say("Voce tem que ser um Dwarf para ser promovido aqui.", cid)
		end
		
	elseif(msgcontains(msg, 'yes') and talkState[talkUser] == 1) then
		if(getPlayerVocation(cid) == 17) then
			if(not doPlayerRemoveMoney(cid, 10000)) then
				npcHandler:say('Desculpe, mas voce nao tem dinheiro suficiente.', cid)
			else
				doPlayerSetVocation(cid, 18)
				npcHandler:say('Voce foi promovido!', cid)
			end
			talkState[talkUser] = 0
			
		elseif(getPlayerVocation(cid) == 18) then
				if(not doPlayerRemoveMoney(cid, 20000)) then
					npcHandler:say('Desculpe, mas voce nao tem dinheiro suficiente.', cid)
				else
					doPlayerSetVocation(cid, 19)
				    npcHandler:say('Voce foi promovido!', cid)
				end
			talkState[talkUser] = 0
			
		elseif(getPlayerVocation(cid) == 19) then
				if(not doPlayerRemoveMoney(cid, 50000)) then
					npcHandler:say('Desculpe, mas voce nao tem dinheiro suficiente.', cid)
				else
					doPlayerSetVocation(cid, 20)
				    npcHandler:say('Voce foi promovido!', cid)
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
