local keyLord = Action()

local keyLordId = 2091
local keyLordAid = 3070 
local enchantedTreeUid = 6109 
local requiredLevel = 200
local positionQuest = Position(1305, 1359, 1)

function keyLord.onUse(player, item, position, target)

    if player:getLevel() >= requiredLevel then 
        if item:getId() == keyLordId then
            if target and target:getUniqueId() == enchantedTreeUid then
                player:teleportTo(positionQuest)
                player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
                item:remove(1)
            end
        end
    else
        player:sendTextMessage(19, "Voc� precisa ser level 200 ou mais.")
    end
end

keyLord:aid(3070)
keyLord:register()