
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


-- OTServ event handling functions start
function onCreatureAppear(cid)              npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)           npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)      npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                          npcHandler:onThink() end
-- OTServ event handling functions end

local travelNode = {}

-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
travelKeyword = keywordHandler:addKeyword({'northern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para Northern por 500 gps?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 500, destination = Position (1536,137,7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?.'})
	
keywordHandler:addKeyword({'viajar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te levar para Northern por uma pequena taxa.'})
keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te levar para Northern por uma pequena taxa.'})
keywordHandler:addKeyword({'ir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te levar para Northern por uma pequena taxa.'})

-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())
