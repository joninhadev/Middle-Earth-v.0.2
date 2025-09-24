local burningIslands = Action()

local requiredDay = "Wednesday"
local burningIsland = Position(465, 1312, 5)
local requiredLevel = 150
local storageAccess = 35707

function burningIslands.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local currentDay = os.date("%A")

    -- Checa level
    if player:getLevel() < requiredLevel then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� precisa ser n�vel " .. requiredLevel .. " ou mais para entrar na Burning Island.")
        return true
    end

    -- Checa se tem acesso ou se � o dia liberado
    if player:getStorageValue(storageAccess) > 0 or currentDay == requiredDay then
        player:teleportTo(burningIsland)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� n�o tem permiss�o para entrar na Burning Island. Ela s� pode ser acessada �s quartas-feiras caso voc� n�o tenha o acesso.")
    end
    return true
end

burningIslands:aid(storageAccess)
burningIslands:register()
