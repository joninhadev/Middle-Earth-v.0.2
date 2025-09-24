local NO_FRAG_AREA = {
    fromPos = {x = 1244, y = 689, z = 6}, -- 1244, 689, 6
    toPos = {x = 1260, y = 725, z = 6} -- 1260, 725, 6
}

local function isInNoFragArea(position)
    return position.x >= NO_FRAG_AREA.fromPos.x and position.x <= NO_FRAG_AREA.toPos.x and
           position.y >= NO_FRAG_AREA.fromPos.y and position.y <= NO_FRAG_AREA.toPos.y and
           position.z >= NO_FRAG_AREA.fromPos.z and position.z <= NO_FRAG_AREA.toPos.z
end

local NO_FRAG_STORAGE = 50001

local healthChange = CreatureEvent("NoFragZoneHealth")
function healthChange.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    
    if not creature:isPlayer() or not attacker:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    
    if creature:getHealth() - primaryDamage <= 0 then
        local creaturePos = creature:getPosition()
        local attackerPos = attacker:getPosition()
        
        if isInNoFragArea(creaturePos) and isInNoFragArea(attackerPos) then
            attacker:setStorageValue(1000, 1)
            addEvent(function(attackerId)
                local player = Player(attackerId)
                if player then
                    player:setStorageValue(1000, -1)
                end
            end, 1000, attacker:getId())
        end
    end
    
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
healthChange:register()

local manaChange = CreatureEvent("NoFragZoneMana")
function manaChange.onManaChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
    if not creature or not attacker then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    
    if not creature:isPlayer() or not attacker:isPlayer() then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
    
    if creature:getMana() - primaryDamage <= 0 and creature:getVocation():getManaMultiplier() > 0 then
        local creaturePos = creature:getPosition()
        local attackerPos = attacker:getPosition()
        
        if isInNoFragArea(creaturePos) and isInNoFragArea(attackerPos) then
            attacker:setStorageValue(1000, 1)
            addEvent(function(attackerId)
                local player = Player(attackerId)
                if player then
                    player:setStorageValue(1000, -1)
                end
            end, 1000, attacker:getId())
        end
    end
    
    return primaryDamage, primaryType, secondaryDamage, secondaryType
end
manaChange:register()

local killEvent = CreatureEvent("NoFragZoneKill")
function killEvent.onKill(player, target)
    if not target:isPlayer() then
        return true
    end
    
    local playerPos = player:getPosition()
    local targetPos = target:getPosition()
    
    if isInNoFragArea(playerPos) and isInNoFragArea(targetPos) then
        player:sendTextMessage(MESSAGE_STATUS_WARNING, "Você não fragou pois está em uma área de PVP.")
        target:sendTextMessage(MESSAGE_STATUS_WARNING, "You died in a no-frag zone! The killer will not receive a frag.")
        
        player:setStorageValue(NO_FRAG_STORAGE, 1)
        
        addEvent(function(playerId)
            local p = Player(playerId)
            if p then
                p:setStorageValue(NO_FRAG_STORAGE, -1)
            end
        end, 2000, player:getId())
        
        return true
    end
    
    return true
end
killEvent:register()

local loginEvent = CreatureEvent("NoFragZoneLogin")
function loginEvent.onLogin(player)
    player:registerEvent("NoFragZoneHealth")
    player:registerEvent("NoFragZoneMana")
    player:registerEvent("NoFragZoneKill")
    return true
end
loginEvent:register()