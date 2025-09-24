local vortexIslands = Action()

local requiredDay = "Saturday"
local vortexIsland = Position(2079, 1364, 6)
local requiredLevel = 150
local storageAccess = 35710

function vortexIslands.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local currentDay = os.date("%A")

    -- Verifica se o jogador tem level mínimo
    if player:getLevel() < requiredLevel then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você precisa ser nível " .. requiredLevel .. " ou mais para entrar na Vortex Island.")
        return true
    end

    -- Teleporte se tiver acesso ou se for o dia liberado
    if player:getStorageValue(storageAccess) > 0 or currentDay == requiredDay then
        player:teleportTo(vortexIsland)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você não tem permissão para entrar na Vortex Island. Ela só pode ser acessada no sábado caso você não tenha o acesso.")
    end
    return true
end

vortexIslands:aid(storageAccess)
vortexIslands:register()
