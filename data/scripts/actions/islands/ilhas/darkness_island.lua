local darknessIslands = Action()

local requiredDay = "Friday"
local darknessIsland = Position(1232, 1775, 3)
local requiredLevel = 150
local storageAccess = 35709

-- Friday = Sexta-feira

function darknessIslands.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local currentDay = os.date("%A")

    -- Checa level m�nimo
    if player:getLevel() < requiredLevel then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� precisa ser n�vel " .. requiredLevel .. " ou mais para entrar na Darkness Island.")
        return true
    end

    -- Checa se tem acesso ou se � o dia liberado
    if player:getStorageValue(storageAccess) > 0 or currentDay == requiredDay then
        player:teleportTo(darknessIsland)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� n�o tem permiss�o para entrar na Darkness Island. Ela s� pode ser acessada �s sextas-feiras caso voc� n�o tenha o acesso.")
    end
    return true
end

darknessIslands:aid(storageAccess)
darknessIslands:register()
