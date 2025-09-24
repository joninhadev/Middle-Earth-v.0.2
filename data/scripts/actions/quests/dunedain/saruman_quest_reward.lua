local sarumanKey = Action()

local level = 200
local sarumanKeyId = 2091
local sarumanEstatuaId = 9751
local sarumanEstatuaUid = 1410
local newPosition = Position(1653, 378, 6)

function sarumanKey.onUse(player, item, position, target)

    if player:getLevel() >= level then 
        if item:getId() == sarumanKeyId then
            if target and target:getId() == sarumanEstatuaId and target:getUniqueId() == sarumanEstatuaUid then 
                player:teleportTo(newPosition)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                item:remove(1)
            end
        end
    else
        player:sendTextMessage(19, "VocÍ precisa ser level 200 ou mais para usar a golden key.")
    end
end

sarumanKey:aid(3050)
sarumanKey:register()

-------------------------  ## AQUI ù A PARTE DA RECOMPENSA DA QUEST ## -----------------

local sarumanReward = Action()

local treasureChest = 1746
local storageReward = 5060

function sarumanReward.onUse(player, item, position)
    
local uid = item:getUniqueId() 

    if player:getStorageValue(storageReward) < 1 then
        if uid == 5011 then
            player:addItem(6528,1)
            player:sendTextMessage(22, "VocÍ obteve a Narsil.")
        elseif uid == 5012 then 
            player:addItem(7424,1)
            player:sendTextMessage(22, "VocÍ obteve uma Aghanim Scepter's.")
        elseif uid == 5013 then
            player:addItem(8855, 1)
            player:sendTextMessage(22, "VocÍ obteve um Eaglehorn.")
        elseif uid == 5014 then
            player:addItem(7414, 1)
            player:sendTextMessage(22, "VocÍ obteve uma Glamdring.")
        elseif uid == 5015 then
            player:addItem(8852, 1)
            player:sendTextMessage(22, "VocÍ obteve uma Buriza.")   
        elseif uid == 5016 then
            player:addItem(2425, 1)
            player:sendTextMessage(22, "VocÍ obteve uma Aiglos.")
        elseif uid == 5017 then   
            player:addItem(8924, 1)     
            player:sendTextMessage(22, "VocÍ obteve um Durins Axe.")
        elseif uid == 5018 then 
            player:addItem(7410, 1)
            player:sendTextMessage(22, "VocÍ obteve uma Mekansm.")
        end
        player:setStorageValue(storageReward, 1)
    else 
        player:sendTextMessage( 22, "VocÍ j· obteve sua recompensa.")
    end
end

sarumanReward:uid(5011, 5012, 5013, 5014, 5015, 5016, 5017, 5018)
sarumanReward:register()