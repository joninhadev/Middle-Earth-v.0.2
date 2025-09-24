function onSay(player, words, param)
    local cities = {
        -- ??? Cidades principais
        ["edoras"]      = {x = 1066, y = 1008, z = 5},
        ["dolguldur"]   = {x = 1206, y = 753, z = 7},
        ["minas"]       = {x = 1344, y = 1371, z = 6},
        ["anfallas"]    = {x = 982, y = 1298, z = 7},
        ["argond"]      = {x = 600, y = 900, z = 7},
        ["dunedain"]    = {x = 1591, y = 371, z = 6},
        ["bree"]        = {x = 737, y = 516, z = 7},
        ["mordor"]      = {x = 1508, y = 1237, z = 7},
        ["esgaroth"]    = {x = 1413, y = 503, z = 7},
        ["rivendell"]   = {x = 1051, y = 541, z = 4},
        ["forodwaith"]  = {x = 710, y = 105, z = 7},
        ["moria"]       = {x = 1063, y = 652, z = 7},
        ["condado"]       = {x = 620, y = 534, z = 7},
        ["enedwaith"]   = {x = 903, y = 1004, z = 7},
        ["umbar"]       = {x = 227, y = 1547, z = 6}
    }

    if param == "house" then
        local house = player:getHouse()
        if not house or not player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) or player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você só pode se teleportar para sua casa estando em zona de proteção, ou você não tem uma casa.")
            return false
        end
        player:getPosition():sendMagicEffect(28)
        player:teleportTo(house:getExitPosition())
        player:getPosition():sendMagicEffect(CONST_ME_BIGCLOUDS)
        return false
    end

    -- precisa estar em PZ
    if not player:getTile():hasFlag(TILESTATE_PROTECTIONZONE) then
        if player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT) then
            player:sendCancelMessage("Você não pode viajar enquanto estiver em batalha.")
            return false
        end
    end

    if not player:isPremium() then
        player:sendTextMessage(19,"Você precisa ser VIP para utilizar esse comando.")
        return false
    end

    if param == "" then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE,
            "As cidades que você pode se teletransportar são: edoras, dolguldur, condado, minas, anfallas, argond, dunedain, bree, mordor, esgaroth, rivendell, forodwaith, moria, umbar.")
        return false
    end

    local destination = cities[string.lower(param)]
    if not destination then
        player:sendCancelMessage("Este local/cidade não existe.")
        return false 
    end

    player:getPosition():sendMagicEffect(28)
    player:teleportTo(destination)
    player:getPosition():sendMagicEffect(CONST_ME_BIGCLOUDS)
    return false
end
