local saleSettings = {
	batchSize = 10000, -- numero maximo de items vendidos por vez
	cooldownToUse = 5 * 60, -- cooldown de uso (10 minutos)
	itemsToSell = {
	
		-- SHIELDS --
		
		{ itemName = "Dwarven Shield", clientId = 2525, sell = 1500 },
		{ itemName = "Tusk Shield", clientId = 3973, sell =  3000},
		{ itemName = "Ancient Shield", clientId = 2532, sell = 4000},
		{ itemName = "Rose Shield", clientId = 2527, sell = 5000},
		{ itemName = "Castle Shield", clientId = 2535, sell =  7000},
		{ itemName = "Bonelord Shield", clientId = 2518, sell =  10000},
		{ itemName = "Griffin Shield", clientId = 2533, sell = 10000},
		{ itemName = "Shield Of Corruption", clientId = 12644, sell = 300000},
		{ itemName = "Prismatic Shield", clientId = 18410, sell = 150000},
		{ itemName = "Warrior's Shield", clientId = 15453, sell =  30000},
		{ itemName = "Guardian Shield", clientId = 2515, sell =  12000},
		{ itemName = "Dragon Shield", clientId = 2516, sell =  14000},
		{ itemName = "Tower Shield", clientId = 2528, sell =  18000},
		{ itemName = "Crown Shield", clientId = 2519, sell =  22000},
		{ itemName = "Amazon Shield", clientId = 2537, sell =  25000},
		{ itemName = "Medusa Shield", clientId = 2536, sell =  30000},
		{ itemName = "Shield of Honour", clientId = 2517, sell =  31000},
		{ itemName = "Vampire Shield", clientId = 2534, sell =  35000},
		{ itemName = "Tempest Shield", clientId = 2542, sell =  150000},
		{ itemName = "Phoenix Shield", clientId = 2539, sell =  150000},
		{ itemName = "Carapace Shield", clientId = 15491, sell =  40000},
		{ itemName = "Demon Shield", clientId = 2520, sell =  50000},
		{ itemName = "Mastermind Shield", clientId = 2514, sell = 80000},
		{ itemName = "Great Shield", clientId = 2522, sell =  250000},
		{ itemName = "Blessed Shield", clientId = 2523, sell =  500000},
		{ itemName = "Cerberus Shield", clientId = 8906, sell =  1000000},
		
		-- SWORDS --
		
		{ itemName = "Wyvern Fang", clientId = 7408, sell = 1400},
		{ itemName = "Twin Hooks", clientId = 11309, sell = 1000},
		{ itemName = "Sting", clientId = 7404, sell =  2700},
		{ itemName = "Fire Sword", clientId = 2392, sell = 4000},
		{ itemName = "Bright Sword", clientId = 2407, sell = 5500},
		{ itemName = "Djinn Blade", clientId = 2451, sell = 7000},
		{ itemName = "Ice Rapier", clientId = 2396, sell = 1000},
		{ itemName = "Pharaoh Sword", clientId = 2446, sell = 13000},
		{ itemName = "Emerald Sword", clientId = 8930, sell = 15000},
		{ itemName = "Haunted Blade", clientId = 7407, sell = 18000},
		{ itemName = "Herugrin Sword", clientId = 7391, sell = 20000},
		{ itemName = "Giant Sword", clientId = 2393, sell = 25000},
		{ itemName = "Demonrage Sword", clientId = 7382, sell = 50000},
		{ itemName = "Warlord Sword", clientId = 2408, sell = 150000},
		{ itemName = "Serpent Sword", clientId = 2409, sell = 900},
		
		-- AXES --
		
		{ itemName = "Halberd", clientId = 2381, sell = 1200},
		{ itemName = "Double Axe", clientId = 2387, sell = 1000},
		{ itemName = "Knight Axe", clientId = 2430, sell = 3000},
		{ itemName = "Frost Razor", clientId = 7455, sell = 6000},
		{ itemName = "Fire Axe", clientId = 2432, sell = 8000},
		{ itemName = "Naginata", clientId = 2426, sell = 7000},
		{ itemName = "Dreaded Cleaver", clientId = 7419, sell = 25000},
		{ itemName = "Axe of Maim", clientId = 3962, sell = 20000},
		{ itemName = "Headchopper", clientId = 7380, sell = 10000},
		{ itemName = "Twin Axe", clientId = 2447, sell = 14000},
		{ itemName = "Guardian Halberd", clientId = 2427, sell = 16000},
		{ itemName = "Reaper's Axe", clientId = 7420, sell = 25000},
		{ itemName = "Vile Axe", clientId = 7388, sell = 38000},
		{ itemName = "Dragon Lance", clientId = 2414, sell = 22000},
		{ itemName = "War Axe", clientId = 2454, sell = 25000},
		{ itemName = "Great Axe", clientId = 2415, sell = 50000},
		{ itemName = "Hive Scythe", clientId = 15492, sell = 30000},
		
		
		-- HELMETS --
		
		{ itemName = "Devil Helmet", clientId = 2462, sell = 3000},
		{ itemName = "Amazon Helmet", clientId = 2499, sell = 4000},
		{ itemName = "Crown Helmet", clientId = 2491, sell =  6000},
		{ itemName = "Beholder Helmet", clientId = 3972, sell = 8000},
		{ itemName = "Warrior Helmet", clientId = 2475, sell = 8500},
		{ itemName = "Crusader Helmet", clientId = 2497, sell =  9500},
		{ itemName = "Skull Helmet", clientId = 5741, sell = 18000},
		{ itemName = "Ceremonial Mask", clientId = 2501, sell = 12000},
		{ itemName = "Royal Helmet", clientId = 2498, sell =  18000},
		{ itemName = "Winged Helmet", clientId = 2474, sell = 25000},
		{ itemName = "Aghanim Mask", clientId = 7901, sell = 20000},
		{ itemName = "Horned Helmet", clientId = 2496, sell = 35000},
		{ itemName = "Glacier Mask", clientId = 7902, sell = 1200},
		{ itemName = "Dragon Scale Helmet", clientId = 2506, sell = 50000},
		{ itemName = "Magic Steel Helmet", clientId = 10316, sell = 45000},
		{ itemName = "Demon Helmet", clientId = 2493, sell = 75000},
		{ itemName = "Magma Monocle", clientId = 7900, sell = 5000},
		{ itemName = "Terra Hood", clientId = 7903, sell = 1800},
		
		-- ARMORS --
		
		{ itemName = "Plate Armor", clientId = 2463, sell = 1400},
		{ itemName = "Glacier Robe", clientId = 7897, sell = 5500},
		{ itemName = "Spellweaver's Robe", clientId = 11355, sell = 5500},
		{ itemName = "Dark Armor", clientId = 2489, sell = 900},
		{ itemName = "Velvet Mantle", clientId = 8868, sell = 6000},
		{ itemName = "Greenwood Coat", clientId = 8869, sell = 6000},
		{ itemName = "Blue Robe", clientId = 2656, sell = 7000},
		{ itemName = "Noble Armor", clientId = 2486, sell = 9000},
		{ itemName = "Amazon Armor", clientId = 2500, sell = 13000},
		{ itemName = "Knight Armor", clientId = 2476, sell = 17000},
		{ itemName = "Terra Mantle", clientId = 7884, sell = 18000},
		{ itemName = "Crown Armor", clientId = 2487, sell = 20000},
		{ itemName = "Focus Cape", clientId = 8871, sell =  6000},
		{ itemName = "Dragon Scale Mail", clientId = 2492, sell = 40000},
		{ itemName = "Pestilence Omega", clientId = 8880, sell = 80000},
		{ itemName = "Elven Armor", clientId = 2505, sell = 6000},
		{ itemName = "Dwarven Armor", clientId = 2503, sell = 8000},
		{ itemName = "Robe of the Underworld", clientId = 8890, sell = 13000},
		{ itemName = "Aghanim Robe", clientId = 7898, sell = 30000},
		{ itemName = "Red Robe", clientId = 2655, sell = 22000},
		{ itemName = "Magma Coat", clientId = 7899, sell = 17000},
		{ itemName = "Dark Lord's Cape", clientId = 8865, sell = 21000},
		{ itemName = "Demon Armor", clientId = 2494, sell = 50000},
		{ itemName = "Windborn Colossus Armor", clientId = 8883, sell = 18000},
		{ itemName = "Oceanborn Leviathan Armor", clientId = 8884, sell = 18000},
		{ itemName = "Fireborn Giant Armor", clientId = 8881, sell = 22000},
		{ itemName = "Aegis Armor", clientId = 3968, sell = 32000},
		{ itemName = "Divine Plate", clientId = 8885, sell = 500000},
		{ itemName = "Frozen Plate", clientId = 8887, sell = 500000},
		{ itemName = "Molten Plate", clientId = 8886, sell = 500000},
		{ itemName = "Khel Thuzad's Skin", clientId = 8889, sell = 280000},
		{ itemName = "Caloptheryx Cape", clientId = 15489, sell = 22000},
		{ itemName = "Zenit Cuirass", clientId = 11301, sell = 50000},
		{ itemName = "Golden Armor", clientId = 2466, sell = 100000},
		{ itemName = "Crystalline Armor", clientId = 8878, sell = 41000},
		
		-- BOOTS --
		
		{ itemName = "Boots of Haste", clientId = 2195, sell = 8000},
		{ itemName = "Terra Boots", clientId = 7886, sell = 6000},
		{ itemName = "Glacier Boots", clientId = 7892, sell = 14000},
		{ itemName = "Magma Boots", clientId = 7891, sell = 18000},
		{ itemName = "Aghanim Boots", clientId = 7893, sell = 25000},
		{ itemName = "Zenit Shoes", clientId = 11303, sell = 50000},
		{ itemName = "Steel Boots", clientId = 2645, sell = 15000},
		
		-- LEGS --
		
		{ itemName = "Plate Legs", clientId = 2647, sell = 2000},
		{ itemName = "Elven Legs", clientId = 2507, sell =  4000},
		{ itemName = "Aghanim Legs", clientId = 7895, sell = 18000},
		{ itemName = "Dwarven Legs", clientId = 2504, sell = 6500},
		{ itemName = "Glacier Kilt", clientId = 7896, sell = 7000},
		{ itemName = "Terra Legs", clientId = 7885, sell = 17000},
		{ itemName = "Knight Legs", clientId = 2477, sell = 12000},
		{ itemName = "Magma Legs", clientId = 7894, sell = 22000},
		{ itemName = "Crown Legs", clientId = 2488, sell = 22000},
		{ itemName = "Dragon Scale Legs", clientId = 2469, sell = 35000},
		{ itemName = "Zenit Legs", clientId = 11304, sell = 42000},
		{ itemName = "Demon Legs", clientId = 2495, sell = 60000},
		{ itemName = "Grasshopper Legs", clientId = 15490, sell = 10000},
		
		-- CLUBS --
		
		{ itemName = "Dragon Hammer", clientId = 2434, sell = 2500},
		{ itemName = "Skull Staff", clientId = 2436, sell = 4000},
		{ itemName = "Sapphire Hammer", clientId = 7437, sell = 5000},
		{ itemName = "Chaos Mace", clientId = 7427, sell = 15000},
		{ itemName = "Crystal Mace", clientId = 2445, sell = 10000},
		{ itemName = "Diamond Sceptre", clientId = 7387, sell = 25000},
		{ itemName = "Heavy Mace", clientId = 2452, sell = 35000},
		{ itemName = "Hammer of Wrath", clientId = 2444, sell = 30000},
		{ itemName = "Spiked Squelcher", clientId = 7452, sell = 22000},
		{ itemName = "War Hammer", clientId = 2391, sell =  18000},
		{ itemName = "Silver Mace", clientId = 2424, sell = 18000},
		{ itemName = "Drachaku", clientId = 11308, sell = 35000},
		
		-- WANDS/RODS --
		
		{ itemName = "Wand of Cosmic Energy", clientId = 2189, sell = 1000},
		{ itemName = "Wand of Inferno", clientId = 2187, sell = 2000},
		{ itemName = "Hailstorm Rod", clientId = 2183, sell = 2000},
		{ itemName = "Arcane Wand", clientId = 2453, sell = 4500},
		{ itemName = "Motaba Wand", clientId = 7379, sell = 7000},
		{ itemName = "Saruman Scepter", clientId = 7451, sell = 16000},
		{ itemName = "Sauron's Breath Scepter", clientId = 8910, sell = 45000},
		
		-- DIAMANTES/JOIAS/ESMERALDAS --
		
		{ itemName = "Red Crystal Fragment", clientId = 18420, sell = 300},
		{ itemName = "Brown Crystal Splinter", clientId = 18417, sell = 300},
		{ itemName = "Prismatic Quartz", clientId = 27630, sell = 700},
		{ itemName = "Violet Crystal Shard", clientId = 18414, sell = 1000},
		{ itemName = "Green Crystal Shard", clientId = 18415, sell = 1000},
		{ itemName = "Hexagonal Ruby", clientId = 34673, sell = 50000},
		{ itemName = "Black Pearl", clientId = 2144, sell = 150},
		{ itemName = "White Pearl", clientId = 2143, sell = 100},
		{ itemName = "Green Gem", clientId = 2155, sell = 1000},
		{ itemName = "Violet Gem", clientId = 2153, sell = 1000},
		{ itemName = "White Gem", clientId = 37495, sell =  20000},
		{ itemName = "Red Gem", clientId = 2156, sell = 1000},
		{ itemName = "Yellow Gem", clientId = 2154, sell = 1000},
		{ itemName = "Blue Gem", clientId = 2158, sell =  1000},
		{ itemName = "Small Topaz", clientId = 9970, sell =  250},
		{ itemName = "Small Emerald", clientId = 2149, sell =  220},
		{ itemName = "Small Amethyst", clientId = 2150, sell =  240},
		{ itemName = "Small Sapphire", clientId = 2146, sell =  180},
		{ itemName = "Small Ruby", clientId = 2147, sell =  260},
		{ itemName = "Small Diamond", clientId = 2145, sell =  300},
		{ itemName = "Cyan Crystal Fragment", clientId = 18419, sell =  600},
		
		-- CREATURES PRODUCTS --
		
		{ itemName = "Dragon Claw", clientId = 10020, sell = 1000},
		{ itemName = "Violet Glass Plate", clientId = 33840, sell = 800},
		{ itemName = "Green Glass Plate", clientId = 33839, sell = 300},
		{ itemName = "Blue Glass Plate", clientId = 33838, sell = 300},
		{ itemName = "Frazzle Tongue", clientId = 22532, sell = 700},
		{ itemName = "Frazzle Skin", clientId = 22533, sell = 400},
		{ itemName = "Behemoth Claw", clientId = 5930, sell = 2000},
		{ itemName = "Compound Eye", clientId = 15486, sell = 150},
		{ itemName = "Kollos Shell", clientId = 15480, sell = 420},
		{ itemName = "Spidris Mandible", clientId = 15485, sell = 450},
		{ itemName = "Crawler Head Plating", clientId = 15482, sell = 210},
		{ itemName = "Werehyaena Nose", clientId = 39347, sell = 120},
		{ itemName = "Cobra Crest", clientId = 36392, sell = 500},
		{ itemName = "Green Crystal Splinter", clientId = 18416, sell = 300},
		{ itemName = "Soul Orb", clientId = 5944, sell = 400},
		{ itemName = "Ivory Carving", clientId = 39349, sell = 300},
		{ itemName = "White Silk Flower", clientId = 39412, sell = 5000},
		{ itemName = "Lion Figurine", clientId = 39185, sell = 20000},
		{ itemName = "Ankh", clientId = 2193, sell = 220},
		{ itemName = "Ogre Ear Stud", clientId = 24844, sell = 500},
		{ itemName = "Ogre Nose Ring", clientId = 24845, sell = 500},
		{ itemName = "Opal", clientId = 24850, sell = 500},
		{ itemName = "Onyx Chip", clientId = 24849, sell = 350},
		{ itemName = "Skull Fetish", clientId = 24847, sell = 500},
		{ itemName = "Rhino Hide", clientId = 27054, sell = 175},
		{ itemName = "Rhino Horn", clientId = 27057, sell = 265},
		{ itemName = "Rhino Horn Carving", clientId = 27056, sell = 300},
		{ itemName = "Demonic Essence", clientId = 6500, sell = 1000},
		{ itemName = "Peacock Feather Fan", clientId = 24631, sell = 350},
		{ itemName = "Golden Lotus Brooch", clientId = 24630, sell = 270},
		{ itemName = "Hellspawn Tail", clientId = 11221, sell = 475},
		{ itemName = "Eye of A Deepling", clientId = 13870, sell = 150},
		{ itemName = "Deeptags", clientId = 15426, sell = 290},
		{ itemName = "Deepling Ride", clientId = 15452, sell = 360},
		{ itemName = "Deepling Filet", clientId = 15488, sell = 120},
		{ itemName = "Deepling Warts", clientId = 15425, sell = 180},
		{ itemName = "Falcon Crest", clientId = 33302, sell = 650},
		{ itemName = "Lion's Mane", clientId = 10608, sell = 60},
		{ itemName = "Purple Tome", clientId = 1982, sell = 1000},
		{ itemName = "Curious Matter", clientId = 26167 , sell = 430},
		{ itemName = "Spark Sphere", clientId = 26174 , sell = 350},
		{ itemName = "Sparkion Claw", clientId = 26158 , sell = 290},
		{ itemName = "Sparkion Stings", clientId = 26161 , sell = 280},
		{ itemName = "Sparkion Tail", clientId = 26159 , sell = 300},
		{ itemName = "Plasma Pearl", clientId = 26162 , sell = 250},
		{ itemName = "Volatile Proto Matter", clientId = 26170 , sell = 300},
		{ itemName = "Crystallized Anger", clientId = 26163 , sell = 400},
		{ itemName = "Silken Bookmark", clientId = 33088, sell = 1300},
		{ itemName = "Quill", clientId = 33089, sell = 1100},
		{ itemName = "Glowing Rune", clientId = 33089, sell = 350},
		{ itemName = "Warmaster's Writeguards", clientId = 11322, sell = 200},
		{ itemName = "Weaver's Wandtip", clientId = 11314, sell = 250},
		{ itemName = "Ring of The Sky", clientId = 2123, sell = 100000},
		{ itemName = "Ultimate Mana Potion", clientId = 26029, sell = 400},
		
		

	}
}

local sellItemAction = Action()

function sellItemAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.AutolootCooldown) > os.time() then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Você tentou vender itens. Por favor, aguarde %d segundos e tente novamente.", saleSettings.cooldownToUse))
		return true
	end

	local itemsSold = 0
	local totalSellValue = 0
	local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
	local itemsInInbox = inbox:getItems()

	if itemsInInbox and #itemsInInbox > 0 then
		for _, itemConfig in ipairs(saleSettings.itemsToSell) do
			local itemIDToSell = itemConfig.clientId
			local sell = itemConfig.sell

			if sell then
				for i = 1, #itemsInInbox do
					local inboxItemID = itemsInInbox[i]:getId()
					local itemCount = itemsInInbox[i]:getCount()

					if inboxItemID == itemIDToSell and (itemCount >= saleSettings.batchSize or itemCount > 0) then
						local sellValue = sell * math.min(saleSettings.batchSize, itemCount)
						itemsInInbox[i]:remove(math.min(saleSettings.batchSize, itemCount))
						itemsSold = itemsSold + math.min(saleSettings.batchSize, itemCount)
						totalSellValue = totalSellValue + sellValue
					end
				end
			end
		end
	end

	if itemsSold > 0 then
		local currentBalance = player:getBankBalance()
		player:setBankBalance(currentBalance + totalSellValue)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Você vendeu %d items, e o valor de %d gold coins foi adicionado a sua conta bancária.", itemsSold, totalSellValue))
		player:setStorageValue(Storage.AutolootCooldown, os.time() + saleSettings.cooldownToUse)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você não tem itens para vender.")
	end
	return true
end

sellItemAction:id(11773)
sellItemAction:register()
