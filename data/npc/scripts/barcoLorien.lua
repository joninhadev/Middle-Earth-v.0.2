
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
travelKeyword = keywordHandler:addKeyword({'pantano'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para o Pantano por 25?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 25, destination = Position (1250, 1075, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?'})

travelKeyword = keywordHandler:addKeyword({'minas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para a Minas Tirith por 250?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 250, destination = Position (1289, 1411, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?'})

travelKeyword = keywordHandler:addKeyword({'rivendell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para Rivendell por 80?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 80, destination = Position (1146, 580, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?'})
	
travelKeyword = keywordHandler:addKeyword({'dolguldur'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para Dol\'Guldur por 55?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 55, destination = Position (1162, 747, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?'})

travelKeyword = keywordHandler:addKeyword({'edoras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para Edoras por 85 gp?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 85, destination = Position (1037, 984, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?.'})

travelKeyword = keywordHandler:addKeyword({'lightvalle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para Lightvalle por 170 gp?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 85, destination = Position (1658, 560, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?.'})
	
travelKeyword = keywordHandler:addKeyword({'mordor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para mordor por 100?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 100, destination = Position (1436, 1278, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?'})
	
travelKeyword = keywordHandler:addKeyword({'dunedain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para dunedain por 70?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 100, destination = Position (1558, 458, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?'})
	
-- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
travelKeyword = keywordHandler:addKeyword({'anfallas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Você quer ir para Anfallas por 200 gps?'})
	travelKeyword:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 200, destination = Position (615, 1461, 7) })
	travelKeyword:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Tá caro demais pra você?.'})
	
keywordHandler:addKeyword({'ir'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te levar para o Pantano, Dol\'Guldur,Rivendell,Edoras, Dunedain, Minas, Anfallas e Mordor por uma pequena taxa.'})
keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te levar para o Pantano, Dol\'Guldur,Rivendell,Edoras, Dunedain, Minas, Anfallas e Mordor por uma pequena taxa.'})
keywordHandler:addKeyword({'viajar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Posso te levar para o Pantano, Dol\'Guldur,Rivendell,Edoras, Dunedain, Minas, Anfallas e Mordor por uma pequena taxa.'})

-- Makes sure the npc reacts when you say hi, bye etc.
npcHandler:addModule(FocusModule:new())

