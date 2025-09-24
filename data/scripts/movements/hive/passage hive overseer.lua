local entranceHive = MoveEvent()
local level = 120
local oldPos = {x = 1524, y = 532, z = 7}
local sdelay = 19984 -- Storage para cooldown
local cooldownTime = 5 -- Tempo de cooldown em segundos

function entranceHive.onStepIn(player, item, pos, fromPosition)
    if not player then
        return true
    end

    local newPos
    if player:getStorageValue(87221) >= 1 then
        newPos = {x = 80, y = 1930, z = 6} -- 80, 1930, 6
    else
        newPos = {x = 80, y = 1930, z = 6} -- Posição padrão
    end

    if player:getStorageValue(sdelay) < os.time() then
        if item:getActionId() == 27719 then
            if player:getLevel() >= level then
                player:teleportTo(newPos)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                player:setStorageValue(sdelay, os.time() + cooldownTime)
            else
                player:teleportTo(fromPosition)
                player:getPosition():sendMagicEffect(CONST_ME_POFF)
                player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa ser level 120 ou superior para entrar na Hive.")
            end
        elseif item:getActionId() == 27718 then
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

entranceHive:aid(27719, 27718)
entranceHive:register()
