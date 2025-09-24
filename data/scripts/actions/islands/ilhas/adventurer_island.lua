local adventurerIslands = Action()

local requiredDay = "Monday"
local adventurerIsland = Position(2067, 282, 6)
local requiredLevel = 150
local storageAccess = 35705

-- Monday (Segunda), Tuesday (Ter�a), Wednesday (Quarta),
-- Thursday (Quinta), Friday (Sexta), Saturday (S�bado), Sunday (Domingo)

function adventurerIslands.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local currentDay = os.date("%A")

    -- Checa level
    if player:getLevel() < requiredLevel then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� precisa ser n�vel " .. requiredLevel .. " ou mais para entrar na Adventurer Island.")
        return true
    end

    -- Checa se tem acesso ou se � o dia liberado
    if player:getStorageValue(storageAccess) > 0 or currentDay == requiredDay then
        player:teleportTo(adventurerIsland)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voc� n�o tem permiss�o para entrar na Adventurer Island. Ela s� pode ser acessada �s segundas-feiras caso voc� n�o tenha o acesso.")
    end
    return true
end

adventurerIslands:aid(storageAccess)
adventurerIslands:register()
