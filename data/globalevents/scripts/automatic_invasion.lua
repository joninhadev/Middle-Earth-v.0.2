local INVASION_TELEPORT_ID = 1387
local INVASION_TELEPORT_AID = 1396
local INVASION_TELEPORT_POSITION = Position(1203, 751, 7)
local WAITING_ROOM_FROM = Position(1124, 718, 7)
local WAITING_ROOM_TO = Position(1142, 734, 7)

local TELEPORT_OPEN_TIME = 5 * 60
local CREATURES_SPAWN_TIME = 2 * 60
local BOSS_SPAWN_TIME = 10 * 60
local MIN_PLAYERS_REQUIRED = 5

local invasionCities = {
    Edoras = {
        bossPos = Position(1049, 1015, 5),
        monsterPositions = {
            Position(1044, 1023, 5), Position(1049, 1029, 5), Position(1038, 1027, 5),
            Position(1039, 1038, 5), Position(1042, 1046, 5), Position(1069, 1017, 5),
			Position(1044, 1023, 5), Position(1049, 1029, 5), Position(1038, 1027, 5),
            Position(1039, 1038, 5), Position(1042, 1046, 5), Position(1069, 1017, 5),
            Position(1066, 1012, 5), Position(1064, 1002, 5), Position(1072, 1005, 6)
        }
    },
    Argond = {
        bossPos = Position(592, 894, 7),
        monsterPositions = {
            Position(592, 898, 7), Position(575, 897, 7), Position(575, 888, 7), Position(571, 880, 7),
			Position(592, 898, 7), Position(575, 897, 7), Position(575, 888, 7), Position(571, 880, 7),
			Position(592, 898, 7), Position(575, 897, 7), Position(575, 888, 7), Position(571, 880, 7),
            Position(591, 872, 7), Position(592, 882, 7), Position(604, 872, 7), Position(606, 882, 7), Position(616, 872, 7)
        }
    },
    Minas = {
        bossPos = Position(1339, 1359, 2),
        monsterPositions = {
            Position(1320, 1365, 2), Position(1316, 1353, 2), Position(1329, 1354, 2),
            Position(1320, 1365, 2), Position(1316, 1353, 2), Position(1329, 1354, 2),
            Position(1320, 1365, 2), Position(1316, 1353, 2), Position(1329, 1354, 2),
            Position(1339, 1362, 2), Position(1347, 1365, 2), Position(1345, 1356, 2),
            Position(1356, 1361, 2), Position(1313, 1350, 2)
        }
    },
    Bree = {
        bossPos = Position(737, 523, 7),
        monsterPositions = {
            Position(722, 526, 7), Position(719, 514, 7), Position(727, 538, 7),
            Position(752, 534, 7), Position(709, 507, 7), Position(719, 511, 7),
            Position(752, 534, 7), Position(709, 507, 7), Position(719, 511, 7),
            Position(729, 509, 7), Position(743, 502, 7), Position(743, 496, 7),
            Position(729, 509, 7), Position(743, 502, 7), Position(743, 496, 7),
            Position(756, 495, 7), Position(766, 503, 7)
        }
    }
}

local invasionDifficulties = {
    Easy = {
        levelRange = {50, 180},
        monsters = {"Dragon", "Dragon Lord", "Hydra", "Defiler"},
        bosses = {"Maxxen", "Shatterer", "Terror Deep", "Zavarash", "Baron Bellow"}
    },
    Medium = {
        levelRange = {181, 380},
        monsters = {"Demon", "Undead Dragon", "Hellhound", "Serpent Spawn", "Shaburak Lord"},
        bosses = {"Drazzak", "God Essence", "The Welter", "Voidborn", "Colored Dragon"}
    },
    Hardcore = {
        levelRange = {381, 9999},
        monsters = {"Burning Book", "Rage Squid", "Guardian of Tales"},
        bosses = {"King Zelos", "Gaz'haragoth"}
    }
}

local function getRandomCity()
    local keys = {}
    for k in pairs(invasionCities) do
        table.insert(keys, k)
    end
    local cityName = keys[math.random(#keys)]
    return cityName, invasionCities[cityName]
end

local function startInvasion(cityName, cityData)
    local players = {}
    local totalLevel = 0

    for x = WAITING_ROOM_FROM.x, WAITING_ROOM_TO.x do
        for y = WAITING_ROOM_FROM.y, WAITING_ROOM_TO.y do
            local pos = Position(x, y, WAITING_ROOM_FROM.z)
            local creature = Tile(pos):getTopCreature()
            if creature and creature:isPlayer() then
                table.insert(players, creature)
                totalLevel = totalLevel + creature:getLevel()
            end
        end
    end

    if #players < MIN_PLAYERS_REQUIRED then
        Game.broadcastMessage("[Invasão] Jogadores insuficientes! A invasão foi cancelada.", MESSAGE_EVENT_ADVANCE)
        print("[Invasion] Nenhum jogador suficiente participou do evento.")
        return
    end

    local averageLevel = totalLevel / #players
    local difficulty
    for _, data in pairs(invasionDifficulties) do
        if averageLevel >= data.levelRange[1] and averageLevel <= data.levelRange[2] then
            difficulty = data
            break
        end
    end
    if not difficulty then
        print("[Invasion] Nenhuma dificuldade encontrada para a média de level.")
        return
    end

    local boss = difficulty.bosses[math.random(#difficulty.bosses)]

    local selectedMonsters = {}
    while #selectedMonsters < 3 do
        local monsterType = difficulty.monsters[math.random(#difficulty.monsters)]
        if not table.contains(selectedMonsters, monsterType) then
            table.insert(selectedMonsters, monsterType)
        end
    end

    addEvent(function()
        for _, monster in ipairs(selectedMonsters) do
            for _, pos in ipairs(cityData.monsterPositions) do
                Game.createMonster(monster, pos)
            end
        end
        Game.broadcastMessage("Criaturas da invasão começaram a surgir em " .. cityName .. "!", MESSAGE_EVENT_ADVANCE)
    end, CREATURES_SPAWN_TIME * 1000)

    addEvent(function()
        local bossMonster = Game.createMonster(boss, cityData.bossPos)
        if bossMonster and bossMonster:getType():isRewardBoss() then
            bossMonster:setReward(true)
        end
        Game.broadcastMessage("O boss " .. boss .. " apareceu em " .. cityName .. "! Enfrentem-no agora!", MESSAGE_EVENT_ADVANCE)
    end, BOSS_SPAWN_TIME * 1000)

    print("[DEBUG] Invasão iniciada em " .. cityName .. " com boss " .. boss)
end

local function openTeleport()
    print("[DEBUG] Criando o teleport da invasão...")

    local cityName, cityData = getRandomCity()

    local tile = Tile(INVASION_TELEPORT_POSITION)
    if not tile then
        print("[ERROR] Tile do teleport não foi encontrado!")
        return
    end

    local teleport = Game.createItem(INVASION_TELEPORT_ID, 1, INVASION_TELEPORT_POSITION)
    if teleport then
        teleport:setActionId(INVASION_TELEPORT_AID)
        print("[DEBUG] Teleport criado com sucesso! (AID: " .. INVASION_TELEPORT_AID .. ")")

        Game.broadcastMessage(string.format(
            "O teleport para a invasão foi criado! Ele desaparecerá em %d minutos.\nCidade da invasão: %s.\nMínimo de jogadores: %d.",
            TELEPORT_OPEN_TIME / 60, cityName, MIN_PLAYERS_REQUIRED
        ), MESSAGE_EVENT_ADVANCE)

        addEvent(function()
            local teleportItem = Tile(INVASION_TELEPORT_POSITION):getItemById(INVASION_TELEPORT_ID)
            if teleportItem then
                teleportItem:remove()
                Game.broadcastMessage(string.format("O teleport foi fechado! As criaturas começarão a surgir em %d minutos!", CREATURES_SPAWN_TIME / 60), MESSAGE_EVENT_ADVANCE)
                startInvasion(cityName, cityData)
            end
        end, TELEPORT_OPEN_TIME * 1000)
    else
        print("[ERROR] Falha ao criar o teleport.")
    end
end

function onTime()
    print("[DEBUG] Evento de invasão ativado pelo GlobalEvents!")
    openTeleport()
    return true
end
