function onSay(cid, words, param)
	local config = {
	pz = false, -- players precisam estar em protection zone para usar? (true or false)
	battle = true, -- players deve estar sem battle (true or false)
	custo = false, -- se os teleport irão custa (true or false)
	need_level = true, -- se os teleport irão precisar de level (true or false)
	premium = true -- se precisa ser premium account (true or false)
	}
	local WAR_ENTROSA = 15600
	local STORAGE_JAIL = 50026
--[[ Config lugares]]--
	local lugar = {
		["promoOrc"] = { -- nome do lugar
		pos = {x=1696, y=1280, z=7},level = 1,price = 0, premium = 1},
		["anfallas"] = { -- nome do lugar
		pos = {x=982, y=1298, z=7},level = 1,price = 0, premium = 1},
		["vamp2"] = { -- nome do lugar
		pos = {x=1818, y=537, z=8},level = 1,price = 0, premium = 1},
		["dol"] = { -- nome do lugar
		pos = {x=1206, y=753, z=7},level = 1,price = 0, premium = 1},
		["edoras"] = { -- nome do lugar
		pos = {x=1066, y=1008, z=5},level = 1,price = 0, premium = 0},
		["bree"] = { -- nome do lugar
		pos = {x=742, y=537, z=7},level = 1,price = 0, premium = 0},
		["mordor"] = { -- nome do lugar
		pos = {x=1519, y=1236, z=7},level = 1,price = 0, premium = 1},
		["belfallas"] = { -- nome do lugar
		pos = {x=1187, y=1514, z=7},level = 1,price = 0, premium = 1},
		["ashenport"] = { -- nome do lugar
		pos = {x=334, y=611, z=6},level = 1,price = 0, premium = 1},
		["esg"] = { -- nome do lugar
		pos = {x=1413, y=502, z=7},level = 1,price = 0, premium = 1},
		["argond"] = { -- nome do lugar
		pos = {x=607, y=867, z=7},level = 1,price = 0, premium = 0},
		["moria"] = { -- nome do lugar
		pos = {x=1018, y=636, z=7},level = 1,price = 0, premium = 1},
		["forod"] = { -- nome do lugar
		pos = {x=709, y=105, z=7},level = 1,price = 0, premium = 1},
		["condado"] = { -- nome do lugar
		pos = {x=621, y=533, z=7},level = 1,price = 0, premium = 1},
		["dunedain"] = { -- nome do lugar
		pos = {x=1591, y=371, z=6},level = 1,price = 0, premium = 1},
		["minas"] = { -- nome do lugar
		pos = {x=1345, y=1371, z=6},level = 1,price = 0, premium = 1},
		["troll1"] = { -- nome do lugar
		pos = {x=1071, y=877, z=8},level = 1,price = 0, premium = 1},
		["troll2"] = { -- nome do lugar
		pos = {x=1168, y=922, z=8},level = 1,price = 0, premium = 1},
		["rot"] = { -- nome do lugar
		pos = {x=1142, y=930, z=9},level = 1,price = 0, premium = 1},
		["pirata"] = { -- nome do lugar
		pos = {x=193, y=651, z=7},level = 1,price = 0, premium = 1},
		["mino1"] = { -- nome do lugar
		pos = {x=740, y=415, z=8},level = 1,price = 0, premium = 1},
		["mino2"] = { -- nome do lugar
		pos = {x=556, y=570, z=7},level = 1,price = 0, premium = 1},
		["pantano"] = { -- nome do lugar
		pos = {x=1247, y=1074, z=7},level = 1,price = 0, premium = 1},
		["eriador"] = { -- nome do lugar
		pos = {x=825, y=724, z=7},level = 1,price = 0, premium = 1},
		["dwarf1"] = { -- nome do lugar
		pos = {x=1410, y=438, z=7},level = 1,price = 0, premium = 1},
		["dwarf2"] = { -- nome do lugar
		pos = {x=1000, y=617, z=7},level = 1,price = 0, premium = 1},
		["macacos1"] = { -- nome do lugar
		pos = {x=1270, y=753, z=7},level = 1,price = 0, premium = 0},
		["macacos2"] = { -- nome do lugar
		pos = {x=624, y=610, z=7},level = 1,price = 0, premium = 1},
		["slime1"] = { -- nome do lugar
		pos = {x=1362, y=1426, z=6},level = 1,price = 0, premium = 1},
		["slime2"] = { -- nome do lugar
		pos = {x=1365, y=475, z=7},level = 1,price = 0, premium = 1},
		["slime3"] = { -- nome do lugar
		pos = {x=433, y=651, z=7},level = 1,price = 0, premium = 1},
		["ghoul"] = { -- nome do lugar
		pos = {x=1136, y=1052, z=7},level = 1,price = 0, premium = 1},
		["bandit1"] = { -- nome do lugar
		pos = {x=1120, y=1090, z=7},level = 1,price = 0, premium = 1},
		["bandit2"] = { -- nome do lugar
		pos = {x=710, y=383, z=7},level = 1,price = 0, premium = 1},
		["cyc1"] = { -- nome do lugar
		pos = {x=1038, y=869, z=7},level = 1,price = 0, premium = 1},
		["cyc2"] = { -- nome do lugar
		pos = {x=1104, y=788, z=10},level = 1,price = 0, premium = 1},
		["cyc3"] = { -- nome do lugar
		pos = {x=1276, y=914, z=6},level = 1,price = 0, premium = 1},
		["stonegolem"] = { -- nome do lugar
		pos = {x=1324, y=1047, z=7},level = 1,price = 0, premium = 1},
		["dworc1"] = { -- nome do lugar
		pos = {x=640, y=214, z=7},level = 1,price = 0, premium = 1},
		["eregion"] = { -- nome do lugar
		pos = {x=901, y=725, z=7},level = 1,price = 0, premium = 1},
		["rhun"] = { -- nome do lugar
		pos = {x=1759, y=813, z=7},level = 1,price = 0, premium = 1},
		["dragonvip"] = { -- nome do lugar
		pos = {x=1539, y=723, z=6},level = 1,price = 0, premium = 1},
		["erebor"] = { -- nome do lugar
		pos = {x=1415, y=424, z=4},level = 1,price = 0, premium = 1},
		["mirkwood"] = { -- nome do lugar
		pos = {x=1253, y=637, z=7},level = 1,price = 0, premium = 1},
		["forochel"] = { -- nome do lugar
		pos = {x=507, y=116, z=6},level = 1,price = 0, premium = 1},
		["carn"] = { -- nome do lugar
		pos = {x=676, y=199, z=6},level = 1,price = 0, premium = 1},
		["enedwaith"] = { -- nome do lugar
		pos = {x=867, y=1004, z=7},level = 1,price = 0, premium = 1},
		["elven"] = { -- nome do lugar
		pos = {x=999, y=582, z=2},level = 1,price = 0, premium = 1},
		["wyvern"] = { -- nome do lugar
		pos = {x=823, y=354, z=6},level = 1,price = 0, premium = 1},
		["corsario"] = { -- nome do lugar
		pos = {x=872, y=1472, z=6},level = 1,price = 0, premium = 1},
		["dunland"] = { -- nome do lugar
		pos = {x=808, y=930, z=7},level = 1,price = 0, premium = 1},
		["beleghost"] = { -- nome do lugar
		pos = {x=182, y=589, z=6},level = 1,price = 0, premium = 1},
		["evendim"] = { -- nome do lugar
		pos = {x=580, y=242, z=6},level = 1,price = 0, premium = 1},
		["bonebeast1"] = { -- nome do lugar
		pos = {x=1302, y=658, z=7},level = 1,price = 0, premium = 1},
		["bonebeast2"] = { -- nome do lugar
		pos = {x=1327, y=1300, z=5},level = 1,price = 0, premium = 1},
		["blacknight1"] = { -- nome do lugar
		pos = {x=861, y=416, z=7},level = 1,price = 0, premium = 1},
		["blacknight2"] = { -- nome do lugar
		pos = {x=1257, y=1371, z=5},level = 1,price = 0, premium = 1},
		["hero1"] = { -- nome do lugar
		pos = {x=1137, y=1453, z=7},level = 1,price = 0, premium = 0},
		["hero2"] = { -- nome do lugar
		pos = {x=1200, y=1440, z=7},level = 1,price = 0, premium = 1},
		["hero3"] = { -- nome do lugar
		pos = {x=1257, y=1367, z=5},level = 1,price = 0, premium = 1},
		["hydra1"] = { -- nome do lugar
		pos = {x=667, y=724, z=6},level = 1,price = 0, premium = 1},
		["hydra2"] = { -- nome do lugar
		pos = {x=526, y=641, z=6},level = 1,price = 0, premium = 1},
		["hydra3"] = { -- nome do lugar
		pos = {x=498, y=686, z=6},level = 1,price = 0, premium = 1},
		["lich"] = { -- nome do lugar
		pos = {x=1470, y=1034, z=7},level = 1,price = 0, premium = 1},
		["icewitch1"] = { -- nome do lugar
		pos = {x=723, y=74, z=7},level = 1,price = 0, premium = 1},
		["crystal"] = { -- nome do lugar
		pos = {x=696, y=80, z=7},level = 1,price = 0, premium = 1},
		["barbarian"] = { -- nome do lugar
		pos = {x=951, y=98, z=7},level = 1,price = 0, premium = 1},
		["dragon1"] = { -- nome do lugar
		pos = {x=679, y=327, z=7},level = 1,price = 0, premium = 1},
		["dragon2"] = { -- nome do lugar
		pos = {x=368, y=660, z=7},level = 1,price = 0, premium = 1},
		["vamp"] = { -- nome do lugar
		pos = {x=1275, y=1382, z=7},level = 1,price = 0, premium = 1},
		["turtle"] = { -- nome do lugar
		pos = {x=452, y=509, z=7},level = 1,price = 0, premium = 1},
		["purga"] = { -- nome do lugar
		pos = {x=1085, y=346, z=7},level = 1,price = 0, premium = 1},
		["northern"] = { -- nome do lugar
		pos = {x=1541, y=142, z=7},level = 1,price = 0, premium = 1},
		["northern2"] = { -- nome do lugar
		pos = {x=1541, y=120, z=7},level = 1,price = 0, premium = 1},
		["ered"] = { -- nome do lugar
		pos = {x=1282, y=90, z=7},level = 1,price = 0, premium = 1},
		["orodruin"] = { -- nome do lugar
		pos = {x=1578, y=1208, z=0},level = 1,price = 0, premium = 1},
		["ice"] = { -- nome do lugar
		pos = {x=859, y=127, z=7},level = 1,price = 0, premium = 1},
		["nimrais"] = { -- nome do lugar
		pos = {x=740, y=1210, z=0},level = 1,price = 0, premium = 1},
		["defiler"] = { -- nome do lugar
		pos = {x=642, y=492, z=7},level = 1,price = 0, premium = 1},
		["behedemon"] = { -- nome do lugar
		pos = {x=996, y=611, z=10},level = 1,price = 0, premium = 1},
		["harlond"] = { -- nome do lugar
		pos = {x=379, y=812, z=5},level = 1,price = 0, premium = 1},
		["riv"] = { -- nome do lugar
		pos = {x=1052, y=541, z=4},level = 1,price = 0, premium = 0},
		["orc"] = { -- nome do lugar
		pos = {x=1275, y=804, z=7},level = 1,price = 0, premium = 1},
		["icewitch2"] = { -- nome do lugar
		pos = {x=1306, y=1290, z=3},level = 1,price = 0, premium = 1},
	    ["roshamuul"] = { -- nome do lugar 
		pos = {x=192, y=1377, z=7},level = 1,price = 0, premium = 1},
		["quara"] = { -- nome do lugar 
		pos = {x=1375, y=246, z=11},level = 1,price = 0, premium = 1},
		["erech"] = { -- nome do lugar 
		pos = {x=681, y=1295, z=5},level = 1,price = 0, premium = 1},
       ["cormaya"] = { -- nome do lugar 
		pos = {x=962, y=1428, z=7},level = 1,price = 0, premium = 1},
		["minoisland"] = { -- nome do lugar 
		pos = {x=556, y=1629, z=7},level = 1,price = 0, premium = 1}
		
	
	}
	local a = lugar[param]
	local STORAGE_IR = 12701
	local delay = 1 * 1.2
	local lastUse = getPlayerStorageValue(cid, STORAGE_IR)
	local ticks = os.time() - lastUse
	if ticks < delay then
		return true
	else
		setPlayerStorageValue(cid, STORAGE_IR, os.time())
	end
	if not(a) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "As cidades que voce pode ir sao: edoras, belfallas, ashenport, bree, riv, dol, esg, argond, moria, mordor, promoOrc, forod, condado, dunedain, anfallas, minas, cormaya.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "As hunts que você pode ir são:")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Até Level 30: troll1, troll2, rot, pirata, mino1, mino2, pantano, eriador, dwarf1, dwarf2, macacos1, macacos2, slime1, slime2, slime3, ghoul, bandit1, bandit2, cyc1, cyc2, cyc3, stonegolem, dworc1, eregion.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "De level 31 a 100: rhun, dragonvip, erebor, mirkwood, forochel, carn, enedwaith, elven, wyvern, corsario, dunland, beleghost, evendim, bonebeast1, bonebeast2, orc, blacknight1, blacknight2, hero1, hero2, hero3, hydra1, hydra2, hydra3, lich, icewitch1, icewitch2, crystal, barbarian, dragon1, dragon2, vamp, turtle, purga, quara")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Level maior que 100: northern, ered, orodruin, ice, nimrais, defiler, behedemon, harlond, northern2, erech, roshamuul, vamp2, minoisland.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Apenas VIP: vamp2, minas, slime1, cyc2, rhun, dragonvip, corsario, beleghost, bonebeast2, blacknight2, hero3, vamp, northern, northern2, ered, orodruin, nimrais, harlond, icewitch2, roshamuul, quara, erech, cormaya, minoisland.")

		return FALSE
	elseif config.premium == true and not isPremium(cid) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Apenas contas VIP tem esse recurso.")
		return FALSE
	elseif getPlayerStorageValue(cid, WAR_ENTROSA) > 0 then
		doPlayerSendTextMessage (cid, MESSAGE_INFO_DESCR, "Você só pode usar o /ir, quando sair da War Anti Entrosa.")
		return FALSE
		elseif getPlayerStorageValue(cid, STORAGE_JAIL) > os.time() then
		        doPlayerSendTextMessage (cid, MESSAGE_INFO_DESCR, 'Você está preso até ' .. os.date("%d/%m/%Y \nHora: %H:%M:%S", getPlayerStorageValue(cid, STORAGE_JAIL)) .. '') 
		return FALSE
         elseif config.need_level == true and getPlayerLevel(cid) < a.level then
                 doPlayerSendTextMessage(cid, 22, "Desculpe,Voce não tem level. voce precisa "..a.level.." level ou mais para ser teleportado.")

       return FALSE
	elseif config.battle == true and getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você não pode se teleportar em uma batalha.")
		return FALSE
	end
	if a.premium == 1 and not isPremium(cid) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você precisa ser VIP.")
		return FALSE
	else
	if getPlayerGroupId(cid) >= 3 then
	doTeleportThing(cid, a.pos)
	else
		doSendMagicEffect(getPlayerPosition(cid),28)
		doTeleportThing(cid, a.pos)
		doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
	end
	end
	return FALSE
end

