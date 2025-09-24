local divineIslands = Action()

local requiredDay = "Sunday"
local divineIsland = Position(2184, 436, 7)
local requiredLevel = 150
local storageAccess = 35711

-- Sunday = Domingo

function divineIslands.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local currentDay = os.date("%A")

    -- Checa level m�nimo
    if player:getLevel() < requiredLevel then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� precisa ser n�vel " .. requiredLevel .. " ou mais para entrar na Divine Island.")
        return true
    end

    -- Checa se tem acesso ou se � o dia liberado
    if player:getStorageValue(storageAccess) > 0 or currentDay == requiredDay then
        player:teleportTo(divineIsland)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� n�o tem permiss�o para entrar na Divine Island. Ela s� pode ser acessada aos domingos caso voc� n�o tenha o acesso.")
    end
    return true
end

divineIslands:aid(storageAccess)
divineIslands:register()
