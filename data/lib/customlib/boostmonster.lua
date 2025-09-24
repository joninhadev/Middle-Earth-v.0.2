if not boostCreature then 
    boostCreature = {} 
end

BoostedCreature = {
    db = true,
    monsters = {
        normal = {
            "Chicken", "Amazon", "Valkyrie", "Rotworm", "Carrion Worm", "Sibang", "Kongra", 
			"Poison Spider", "Scorpion", "Spider", "Tarantula", "Bear", "Polar Bear", "Gazer", 
			"War Wolf", "Winter Wolf", "Wolf", "Fire Devil", "Water Buffalo", "Swampling", 
			"Novice Of The Cult", "Dwarf", "Ghost", "Lizard Sentinel", "Minotaur", 
			"Minotaur Archer", "Orc", "Orc Rider", "Orc Shaman", "Orc Spearman", "Orc Warrior", 
			"Assassin", "Bandit", "Nomad", "Smuggler", "Stalker", "Wild Warrior", 
			"Piarete Marauder", "Crocodile", "Uruk-Hai"
        },
        second = {
            "Merklin", "Carniphila", "Barbarian Bloodwalker", "Barbarian Brutetamer", "Barbarian Headsplitter", "Barbarian Skullhunter",
			"Beholder", "Elder Beholder", "Terror Bird", "Blood Crab", "Frost Giant", "Frost Giantess", "Yeti",
			"Acolyte Of The Cult", "Adepth Of The Cult", "Enlightened Of The Cult",
			"Dragon", "Dwarf Geomancer", "Dwarf Guard", "Elephant", "Elf Soldier", "Elf Ranger",
			"Gargoyle", "Stone Golem", "Pirate Ghost", "Cyclops", "Cyclops Drone",
			"Minotaur Guard", "Monk", "Dark Monk", "Necromancer", "Priestess",
			"Orc Berserker", "Orc Leader", "Orc Warlord", "Hunter",
			"Pirate Buccaneer", "Pirate Corsair", "Pirate Cutthroat",
			"Fire Elemental", "Quara Constrictor", "Quara Mantassin", "Wyvern",
			"Bonebeast", "Demon Skeleton", "Slime", "Acid Blob", "Death Blob", "Mercury Blob",
			"Wailing Widow", "Ice Witch", "Thornback Tortoise", "Crypt Shambler", "Mummy", "Vampire",
			"Dragon Hatchling", "Dragon Lord Hatchling", "Haunted Treeling", "Nightstalker",
			"Insectoid Worker", "Waspoid", "Crawler", "Giant Spider", "Ancient Scarab",
			"Hero", "Black Knight", "Quara Hydromancer", "Quara Pincher", "Quara Predator",
			"Banshee", "Lich", "Frost Torog", "Vampire Bride", "Werewolf", "Mutated Bat", "Earth Elemental"
        },
        third = {
            "Hellhound", "Dark Torturer", "Demon", "Destroyer", "Gravedigger", "Diabolic Imp", "Fury", "Hand of Cursed Fate", "Nightmare", "Plaguesmith", "Frost Dragon", "Dragon Lord",
			"Hydra", "Behemoth", "Stampor", "Stone Rhino", "Hellfire Fighter", "Serpent Spawn", "Lost Soul", "Undead Dragon", "Defiler", "Warlock", "Blightwalker", "Juggernaut",
			"Mancubus", "Hellforger Cyclops", "Cyclopslave", "Abyssal Cursed Stone", "Uruloki", "Draco", "Dragonling", "Ghastly Dragon", "Wyrm", "Elder Wyrm", "Magma Crawler", "Chaos Draco",
			"Spirit of Fire", "Lizard Zaogun", "Lizard Chosen", "Lizard Dragon Priest", "Lizard High Guard", "Lizard Legionnaire", "Draken Warmaster", "Draken Spellweaver", "Draken Elite",
			"Grim Reaper", "Allukard", "Mephisto", "Terminator", "High Elf", "Enyd", "Oxyurus", "Medusa", "Ice Serpente", "Bloodboil", "Solarian", "Shade of Akama", "Soul Burner", "Iron Blight",
			"Stone Devourer", "Deepling Warrior", "Breach Brood", "Dread Intruder", "Spark of Destruction", "Menacing Carnivor", "Lumbering Carnivor", "Spiky Carnivor", "Shaburak Prince", "Shaburak Lord",
			"Shaburak Demon", "Cobra Assassin", "Cobra Scout", "Cobra Vizier", "Shadow Spectre", "Burster Spectre", "White Lion", "Werelion", "Werelioness", "Midnight Asura", "Dawnfire Asura",
			"True Midnight Asura", "True Dawnfire Asura", "Rage Squid", "Guardian of Tales", "Burning Book", "Squid Warden", "Animated Feather", "Icecold Book", "Falcon Knight", "Falcon Paladin",
			"War Dragon", "Dragolisk", "Mega Dragon", "Souleater"
        },
        boss = {
			"Lokathmor", "Ancalagon the Black", "Alptramun", "Glaurivorn", "Yselda", "Lorien", "Izcandar", "Maxxen", "Shatterer", "Terror Deep", "Zavarash", "Baron Bellow",
			"Drazzak", "God Essence", "The Welter", "Voidborn", "Colored Dragon",
			"Grand Master Oberon", "Scarlett Etzel", "Thorondor", "General Azog",
			"Khamul", "Morgomir", "The Betrayer", "The Dark Marshal", "The Dwimmerlaik", "The Knight of Umbar", "The Shadow Lord", "The Tainted", "The Undying", "Grishnakh", "Kalyassa"
		}
    },
    bonuses = {
        normal = { exp = {min = 30, max = 30}, loot = {min = 5, max = 5} },
        second = { exp = {min = 30, max = 30}, loot = {min = 5, max = 5} },
        third = { exp = {min = 30, max = 30}, loot = {min = 5, max = 5} },
        boss = { exp = {min = 30, max = 30}, loot = {min = 5, max = 5} }
    },
    positions = {
        normal = Position(32367, 32232, 7),
        second = Position(32369, 32232, 7),
        third = Position(32371, 32232, 7),
        boss = Position(32373, 32232, 7)
    },
    messages = {
        normal = "The chosen creature is %s. When killed, you receive +%d experience and +%d loot.",
        second = "The second chosen creature is %s. When killed, you receive +%d experience and +%d loot.",
        third = "The third chosen creature is %s. When killed, you receive +%d experience and +%d loot.",
        boss = "The boss chosen creature is %s. When killed, you receive +%d experience and +30 loot."
    },
    -- Dias da semana para cada tipo de criatura boosted
    -- Em Lua, os.date("*t").wday retorna:
    -- 1 = Domingo, 2 = Segunda, 3 = Terça, 4 = Quarta, 5 = Quinta, 6 = Sexta, 7 = Sábado
    schedule = {
        normal = {1, 2, 3, 4, 5, 6, 7}, -- Todos os dias
        second = {1, 2, 3, 4, 5, 6, 7}, -- Todos os dias
        third = {1, 2, 3, 4, 5, 6, 7},  -- Todos os dias
        boss = {1, 2, 3, 4, 5, 6, 7} -- Domingo (1) e quarta (4)
    }
}

function BoostedCreature:start()
    math.randomseed(os.time())
    for i = 1, 10 do
        math.random()
    end
    
    local currentDayOfWeek = os.date("*t").wday
    
    local rand = math.random
    boostCreature = {}
    
    for category, monsterList in pairs(self.monsters) do
        local isDayScheduled = false
        
        for _, day in ipairs(self.schedule[category]) do
            if day == currentDayOfWeek then
                isDayScheduled = true
                break
            end
        end
        
        if isDayScheduled then
            local monsterRand = monsterList[rand(#monsterList)]
            local expRand = rand(self.bonuses[category].exp.min, self.bonuses[category].exp.max)
            local lootRand = rand(self.bonuses[category].loot.min, self.bonuses[category].loot.max)
            table.insert(boostCreature, {name = monsterRand:lower(), exp = expRand, loot = lootRand, category = category})
            
            local monster = Game.createMonster(boostCreature[#boostCreature].name, self.positions[category], false, true)
            if monster then
                monster:setDirection(SOUTH)
            end
        end
    end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function getBoostedCreature()
    return boostCreature
end