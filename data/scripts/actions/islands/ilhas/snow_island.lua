local snowIslands = Action()

local requiredDay = "Tuesday"
local snowIsland = Position(2113, 142, 7)
local requiredLevel = 150
local storageAccess = 35706

function snowIslands.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local currentDay = os.date("%A")

    -- Verifica se o jogador tem level m�nimo
    if player:getLevel() < requiredLevel then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� precisa ser n�vel " .. requiredLevel .. " ou mais para entrar na Snow Island.")
        return true
    end

    -- Teleporte se tiver acesso ou se for o dia liberado
    if player:getStorageValue(storageAccess) > 0 or currentDay == requiredDay then
        player:teleportTo(snowIsland)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� n�o tem permiss�o para entrar na Snow Island. Ela s� pode ser acessada �s ter�as-feira caso voc� n�o tenha o acesso.")
    end
    return true
end

snowIslands:aid(storageAccess)
snowIslands:register()
