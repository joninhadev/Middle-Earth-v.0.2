-- For full information, visit http://otfans.net/showthread.php?p=849367
-- a magic sword, 5 meats and a key with actionId 2149
-- parameters = {rewards = {{2400}, {2666, 5}, {2086, 1, 2149}}, storageValue = item.uid, itemName = getItemName(item.itemid)}

function onUse(cid, item, frompos, item2, topos)
	if (item.uid == 1000) then
		-- Frosts - Hailstorm rod
		parameters = {reward = {2183}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1001) then
		-- Black Knights - Knight Axe
		parameters = {reward = {2430}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1002) then
		-- Dwarfs - dwarven legs
		parameters = {reward = {2504}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1003) then
		-- Amazons - ripper lance
		parameters = {reward = {3964}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1004) then
		-- Cathedral - Blue Robe
		parameters = {reward = {2656}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1005) then
		-- Cathedral - Skull Staff
		parameters = {reward = {2436}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1006) then
		-- Bree - Chain Armor
		parameters = {reward = {2464}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1007) then
		-- Minos - Scale Armor
		parameters = {reward = {2483}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1008) then
		-- Dworcs - Native Armor
		parameters = {reward = {2508}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1009) then
		-- DL sub - Wand of Inferno
		parameters = {reward = {2187}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1010) then
		-- Frosts - Red Robe
		parameters = {reward = {2655}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1011) then
		-- Pirates - Pirate Boots
		parameters = {reward = {5462}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1012) then
		-- Undeads - Ice Rapier
		parameters = {reward = {2396}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1013) then
		-- Hero - Noble Armor
		parameters = {reward = {2486}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1014) then
		-- Hero - Horseman Helmet
		parameters = {reward = {3969}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1015) then
		-- Pit - Devil Helmet
		parameters = {reward = {2462}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1017) then
		-- Cyc - Dark Helmet
		parameters = {reward = {2490}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1018) then
		-- Quara - Glacier Kilt
		parameters = {reward = {7896}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1019) then
		-- Pirata - Helmet of the Deep
		parameters = {reward = {5461}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1020) then
		-- GS - Arcane Wand
		parameters = {reward = {2453}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1021) then
		-- Barbarians - Glacier Boots
		parameters = {reward = {7892}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1022) then
		-- Hellhounds - Magma Legs
		parameters = {reward = {7894}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1023) then
		-- Macacos - 
		parameters = {reward = {2087,1,3001}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1024) then
		-- Macacos - 
		parameters = {reward = {2087,1,3002}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1025) then
		-- Macacos - 
		parameters = {reward = {2087,1,3003}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1026) then
		-- Terror Birds - Barbarian Axe
		parameters = {reward = {2429}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1027) then
		-- Lava Succubus - Magma Coat
		parameters = {reward = {7899}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1028) then
		-- Orc Fortress - sapphire hammer
		parameters = {reward = {7437}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1029) then
		-- Ilha - Fire Axe
		parameters = {reward = {2432}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1030) then
		-- Ferumbras - Saruman Scepter
		parameters = {reward = {7451}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1031) then
		--  Dragon VIP - Ring of the Tarrasque
		parameters = {reward = {6300}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1032) then
		--  Frost Razor
		parameters = {reward = {7455}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1033) then
		--  Bright Sword
		parameters = {reward = {2407}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1034) then
		--  Crossbow
		parameters = {reward = {2455}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1035) then
		--  BOH
		parameters = {reward = {2195}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1036) then
		--  Crown
		parameters = {reward = {2128}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1037) then
		--  glacier robe
		parameters = {reward = {7897}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1038) then
		--  Aghanim legs
		parameters = {reward = {7895}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1039) then
		--  golden key
		parameters = {reward = {2091,1,666}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1040) then
		--  motaba wand
		parameters = {reward = {7379}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1041) then
		--  devil helmet
		parameters = {reward = {2462}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1042) then
		--  light shovel
		parameters = {reward = {5710}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1043) then
		--  ice rapier
		parameters = {reward = {2396}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1044) then
		--  amazon armor
		parameters = {reward = {2500}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1045) then
		--  Ancient Rune
		parameters = {reward = {2348}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1046) then
		--  Guardian Shield
		parameters = {reward = {2515}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1047) then
		--  Guardian Halberd
		parameters = {reward = {2427}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1048) then
		--  Gandalf Ring
		parameters = {reward = {2357}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1049) then
		--  Soft Boots
		parameters = {reward = {2640}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1050) then
		--  Aghanim Boots
		parameters = {reward = {7893}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1051) then
		--  Holly Orchid
		parameters = {reward = {5922}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1052) then
		--  Pirate Boots
		parameters = {reward = {5462}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1053) then
		--  Tower Shield
		parameters = {reward = {2528}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1054) then
		--  Damaged Helmet
		parameters = {reward = {2339}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1055) then
		--  helmet ornament
		parameters = {reward = {2335}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1056) then
		--   piece of helmet of the ancient
		parameters = {reward = {2336}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1057) then
		--  piece of helmet of the ancient
		parameters = {reward = {2337}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1058) then
		--  piece of helmet of the ancient
		parameters = {reward = {2338}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1059) then
		--  piece of helmet of the ancient
		parameters = {reward = {2340}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1060) then
		--  piece of helmet of the ancient
		parameters = {reward = {2341}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1061) then
		--  terra amulet
		parameters = {reward = {7887}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1062) then
		--  cook book
		parameters = {reward = {2347}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1063) then
		--  strange book
		parameters = {reward = {6103}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1064) then
		--  defiler remains
		parameters = {reward = {6552}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1065) then
		--  aghanim robe
		parameters = {reward = {7898}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1066) then
		--  estilingue
		parameters = {reward = {5907}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1067) then
		--  elven bow
		parameters = {reward = {7438}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1068) then
		--  vampire dust
		parameters = {reward = {6551}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1069) then
		--  amulet of loss
		parameters = {reward = {2173}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1070) then
		--  bruning heart
		parameters = {reward = {2353}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1071) then
		--  steel helmet
		parameters = {reward = {2457}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1072) then
		--  brass armor
		parameters = {reward = {2465}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1073) then
		--  scale armor
		parameters = {reward = {2483}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1074) then
		--  scimitar
		parameters = {reward = {2419}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1075) then
		--  brass legs
		parameters = {reward = {2478}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1076) then
		--  crocodile boots
		parameters = {reward = {3982}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1077) then
		--  battle axe
		parameters = {reward = {2378}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1078) then
		--  mysterious fetish
		parameters = {reward = {2194}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1079) then
		--  drum
		parameters = {reward = {14331}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1080) then
		--  plate armor
		parameters = {reward = {2463}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1081) then
		--  black perl
		parameters = {reward = {2144}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1082) then
		--  dwarven legs
		parameters = {reward = {2504}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1083) then
		--  green gem
		parameters = {reward = {2155}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1084) then
		--  iron helmet
		parameters = {reward = {2459}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1085) then
		--  wand of cosmic energy
		parameters = {reward = {2189}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1086) then
		--  Saurons Breath Scepter
		parameters = {reward = {8910}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1087) then
		--  Dark Lords Cape
		parameters = {reward = {8865}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1088) then
		--  Warsinger Bow
		parameters = {reward = {8854}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1089) then
		--  Ancient Tiara
		parameters = {reward = {2139}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1090) then
		--  Phoenix Plate
		parameters = {reward = {8877}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1091) then
		--  Vile Axe
		parameters = {reward = {7388}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1092) then
		--  Emerald Sword
		parameters = {reward = {8930}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1093) then
		--  Backpack Yalahar
		parameters = {reward = {9774}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1094) then
		--  Icicle
		parameters = {reward = {4848}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1095) then
		--  Blue Note
		parameters = {reward = {2349}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1096) then
		--  Crystaline Armor
		parameters = {reward = {8878}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1097) then
		--  Tear of Daraman
		parameters = {reward = {2346}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1098) then
		--  Hailstorm Rod
		parameters = {reward = {2183}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1099) then
		--  Griffen shield
		parameters = {reward = {2533}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1100) then
		--  Raspberry
		parameters = {reward = {8840,1}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1101) then
		--  Raspberry
		parameters = {reward = {8840,1}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1102) then
		--  Shield of Honor
		parameters = {reward = {2517}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1103) then
		--  Yellow Gem
		parameters = {reward = {2154}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1104) then
		--  Native Armor
		parameters = {reward = {2508}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1105) then
		--  Gold Nugget
		parameters = {reward = {2157}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1106) then
		--  Magician Hat
		parameters = {reward = {2323}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1107) then
		--  Divine Armor
		parameters = {reward = {9776}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1108) then
		--  Legolas Plate
		parameters = {reward = {8891}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1109) then
		--  Pharao Sword
		parameters = {reward = {2446}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1110) then
		--  Zenit Cuirass
		parameters = {reward = {11301}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1111) then
		--  Divine Robe
		parameters = {reward = {11356}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1112) then
		--  Divine Scepter
		parameters = {reward = {7429}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1113) then
		--  Dragon Scale Boots
		parameters = {reward = {11118}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1114) then				
		--  Blockers Ring
		parameters = {reward = {2164,100}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1115) then		
		--  Montaria Joaninha
		parameters = {reward = {15546}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	elseif (item.uid == 1116) then	
		--  Montaria Crustacio
		parameters = {reward = {13305}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
       elseif (item.uid == 1117) then	
		--  Tempest Shield
		parameters = {reward = {2138}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
       elseif (item.uid == 1118) then	
		--  Starlight amulet
		parameters = {reward = {2542}, storageValue = item.uid, itemName = getItemName(item.itemid), requiredLevel = (item.actionid - 1000)}
	else
		return TRUE
	end
	
	



    local rewardProtection = parameters.rewardProtection
    local requiredVocation = parameters.requiredVocation
    local requiredSex = parameters.requiredSex
    local requiredLevel = parameters.requiredLevel
    local requiredMagicLevel = parameters.requiredMagicLevel
    local requiredSoul = parameters.requiredSoul
    local requiredStorageValue = parameters.requiredStorageValue
    local premiumRequired = parameters.premiumRequired
    local itemName = parameters.itemName
    local storageValue = parameters.storageValue
    local containerId = parameters.containerId
    local reward = parameters.reward
    local rewards = parameters.rewards
    local playerMagicEffect = parameters.playerMagicEffect
    
   
    if (rewardProtection ~= nil and getPlayerAccess(cid) >= rewardProtection) then
        if (itemName ~= nil) then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Esta " .. itemName .. " esta vazia.")
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Esta vazio.")
        end
        
        return TRUE
    end
   
    
    if (storageValue ~= nil and getPlayerStorageValue(cid, storageValue) > 0) then
        if (itemName ~= nil) then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Esta " .. itemName .. " esta vazia.")
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Esta vazio.")
        end
        
        return TRUE
    end
    
    if (requiredVocation ~= nil) then
        if (type(requiredVocation) == "table") then
            if (isInArray(requiredVocation, getPlayerVocation(cid)) == FALSE) then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua classe nao pode completar esta quest.")
                
                return TRUE
            end
        else
            if (getPlayerVocation(cid) ~= requiredVocation) then
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua classe nao pode completar esta quest.")
                
                return TRUE
            end
        end
    end
    
    if (requiredSex ~= nil and getPlayerSex(cid) ~= requiredSex) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your sex can not to take this reward.")
        
        return true
    end
    
    if (requiredLevel ~= nil and getPlayerLevel(cid) < requiredLevel) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao tem level suficiente.")
        
        return true
    end
    
    if (requiredMagicLevel ~= nil and getPlayerMagLevel(cid) < requiredMagicLevel) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not have enought magic level to take this reward.")
        
        return true
    end
    
    if (requiredSoul ~= nil and getPlayerSoul(cid) < requiredSoul) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not have enought soul to take this reward.")
        
        return true
    end
    
    if (requiredStorageValue ~= nil and getPlayerStorageValue(cid, requiredStorageValue) <= 0) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You do not can take this reward yet.")
        
        return true
    end
    
    if (premiumRequired ~= nil and premiumRequired >= 1 and isPremium(cid) == FALSE) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce precisa ser VIP para terminar esta quest.")
        
        return true
    end
    
    local leftSlot = getPlayerSlotItem(cid, CONST_SLOT_LEFT)
    local rightSlot = getPlayerSlotItem(cid, CONST_SLOT_RIGHT)
    local ammunitionSlot = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
    local backpackSlot = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    
    if (leftSlot.itemid > 0 and rightSlot.itemid > 0 and ammunitionSlot.itemid > 0 and (isContainer(backpackSlot.uid) == FALSE or getContainerCap(backpackSlot.uid) == getContainerSize(backpackSlot.uid))) then
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce nao tem espaco suficiente.")
        
        return FALSE
    end
    
    if (reward ~= nil and rewards == nil) then
        if (reward[1] == nil) then
            debugPrint("doPlayerAddQuestReward() - reward ID not found")
            
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Error. Please report to a gamemaster.")
            
            return FALSE
        end
        
        if (reward[2] == 0 or reward[2] == nil) then
            reward[2] = 1
        end
        
        local rewardEx = doCreateItemEx(reward[1], reward[2])
        local rewardWeight = getItemWeight(rewardEx)
        local i = 1
        
        doRemoveItem(rewardEx)
        
        if (rewardWeight > getPlayerFreeCap(cid)) then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O item esta pesado demais pra voce.")
            
            return FALSE
        end
        
        local rewardDescriptions = getItemDescriptions(reward[1])
        
        if (reward[2] == 1 or isItemRune(reward[1]) == TRUE or isItemFluidContainer(reward[1]) == TRUE) then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce encontrou " .. rewardDescriptions.article .. " " ..  rewardDescriptions.name .. ".")
        else
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce encontrou " .. reward[2] .. " " ..  rewardDescriptions.plural .. ".")
        end
        
        local reward_ = doPlayerAddItem(cid, reward[1], reward[2])
        
        if (reward[3] ~= nil) then
            doSetItemActionId(reward_, reward[3])
        end
        
        if (reward[4] ~= nil) then
            doSetItemSpecialDescription(reward_, reward[4])
        end
    else
        if (containerId == nil) then
            containerId = 1987
        end
        
        local containerEx = doCreateItemEx(containerId, 1)
        local containerWeight = getItemWeight(containerEx)
        local rewardWeight = containerWeight
        local i = 1
        
        for i, j in ipairs(rewards) do
            if (j[1] == nil) then
                debugPrint("doPlayerAddQuestReward() - #" .. i .. ", reward ID not found")
                
                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Error. Please report to a gamemaster.")
                
                return FALSE
            end
            
            if (j[2] == 0 or j[2] == nil) then
                j[2] = 1
            end
            
            local rewardEx = doCreateItemEx(j[1], j[2])
            rewardWeight = rewardWeight + getItemWeight(rewardEx)
            
            doRemoveItem(rewardEx, 1)
        end
        
        if (rewardWeight > getPlayerFreeCap(cid)) then
            doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O item esta pesado demais pra voce.")
            
            return FALSE
        end
        
        local containerDescriptions = getItemDescriptions(containerId)
        
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce encontrou " .. containerDescriptions.article .. " " ..  containerDescriptions.name .. ".")
        
        for i, j in ipairs(rewards) do
            if (j[2] == 0 or j[2] == nil) then
                j[2] = 1
            end
            
            reward = doAddContainerItem(containerEx, j[1], j[2])
            
            if (j[3] ~= nil) then
                doSetItemActionId(reward, j[3])
            end
            
            if (j[4] ~= nil) then
                doSetItemSpecialDescription(reward, j[4])
            end
        end
        
        doPlayerAddItemEx(cid, containerEx)
    end
    
    if (playerMagicEffect ~= nil) then
        doSendMagicEffect(getPlayerPosition(cid), playerMagicEffect)
    end
    
    if (storageValue ~= nil) then
        setPlayerStorageValue(cid, storageValue, 1)
    end
    
    return TRUE
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        