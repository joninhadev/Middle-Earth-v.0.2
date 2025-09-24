local tpWerelair = Action()
local level = 200
local newPos = {x = 1834, y = 36, z = 8} -- 1834, 36, 8
local oldPos = {x = 1547, y = 269, z = 7} -- 1547, 269, 7
local sdelay = 19983 -- Storage para cooldown
local cooldownTime = 5 -- Tempo de cooldown em segundos

function tpWerelair.onUse(player, item)
    if player:getLevel() >= level then
        if player:getStorageValue(sdelay) < os.time() then
            if item:getActionId() == 44331 then
                player:teleportTo(newPos)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                player:setStorageValue(sdelay, os.time() + cooldownTime)
            elseif item:getActionId() == 44332 then
                player:teleportTo(oldPos)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                player:setStorageValue(sdelay, os.time() + cooldownTime)
            end
        else
            player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você deve esperar " .. cooldownTime .. " segundos para entrar ou sair do covil.")
        end
    else
        player:sendTextMessage(MESSAGE_STATUS_SMALL, "Você precisa ser level " .. level .. " ou maior para acessar Werehyaena Lairs.")
    end
    return true
end

tpWerelair:aid(44331, 44332)
tpWerelair:register()
