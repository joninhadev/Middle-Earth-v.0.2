local venomIslands = Action()

local requiredDay = "Thursday"
local venomIsland = Position(959, 1784, 7)
local requiredLevel = 150
local storageAccess = 35708

function venomIslands.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local currentDay = os.date("%A")

    -- Verifica se o jogador tem level m�nimo
    if player:getLevel() < requiredLevel then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� precisa ser n�vel " .. requiredLevel .. " ou mais para entrar na Venom Island.")
        return true
    end

    -- Teleporte se tiver acesso ou se for o dia liberado
    if player:getStorageValue(storageAccess) > 0 or currentDay == requiredDay then
        player:teleportTo(venomIsland)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� n�o tem permiss�o para entrar na Venom Island. Ela s� pode ser acessada �s quintas-feira caso voc� n�o tenha o acesso.")
    end
    return true
end

venomIslands:aid(storageAccess)
venomIslands:register()
