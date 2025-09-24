local gazerNextHunt = MoveEvent()
local level = 250
local oldPos = {x = 674, y = 790, z = 10} -- 674, 790, 10
local sdelay = 19984 -- Storage para cooldown
local cooldownTime = 5 -- Tempo de cooldown em segundos

function gazerNextHunt.onStepIn(player, item, pos, fromPosition)
    if not player then
        return true
    end

    local newPos
    if player:getStorageValue(87221) >= 1 then
        newPos = {x = 654, y = 815, z = 10} -- 80, 1930, 6
    else
        newPos = {x = 654, y = 815, z = 10} -- Posição padrão
    end

    if player:getStorageValue(sdelay) < os.time() then
        if item:getActionId() == 11798 then
            if player:getLevel() >= level then
                player:teleportTo(newPos)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                player:setStorageValue(sdelay, os.time() + cooldownTime)
            else
                player:teleportTo(fromPosition)
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa ser level 250 ou mais para atravessar.")
            end
        elseif item:getActionId() == 11799 then
            player:teleportTo(oldPos)
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
            player:setStorageValue(sdelay, os.time() + cooldownTime)
        end
    else
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você deve esperar " .. cooldownTime .. " segundos para usar este teleporte novamente.")
        player:teleportTo(fromPosition)
    end

    return true
end

gazerNextHunt:aid(11798, 11799)
gazerNextHunt:register()
