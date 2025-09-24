local entrarWerelions = Action()

local requiredLevel = 230
local stepOne = Position(1787, 632, 11)
local stepBack = Position(1759, 432, 5)
local stepBackTwo = Position(1751, 696, 11)
local stepTwo = Position(1749, 661, 12)
local delaySeconds = 2 
local cooldownStorage = 101010 

function entrarWerelions.onUse(player, item, position)
    local currentTime = os.time()
    local lastUse = player:getStorageValue(cooldownStorage)

    if lastUse ~= -1 and currentTime - lastUse < delaySeconds then
        player:sendCancelMessage("Espere um pouco antes de usar isso novamente.")
        return true
    end

    player:setStorageValue(cooldownStorage, currentTime)

    if item:getActionId() == 38768 then
        if player:getLevel() >= requiredLevel then
            player:teleportTo(stepOne)
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        else
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "Você precisa ser level 230 ou mais para entrar nos Werelions!")
        end

    elseif item:getActionId() == 38769 then
        player:teleportTo(stepBack)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	elseif item:getActionId() == 38770 then
        player:teleportTo(stepTwo)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
	elseif item:getActionId() == 38771 then
        player:teleportTo(stepBackTwo)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)	
    end

    return true
end

entrarWerelions:aid(38768, 38769, 38770, 38771)
entrarWerelions:register()
