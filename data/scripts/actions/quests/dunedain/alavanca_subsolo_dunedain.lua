local subsolo = Action()
local newPosition = Position(1574,479,7)

function subsolo.onUse(player, item, position)

    if player:isPremium() then
        player:teleportTo(newPosition)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(19, "Apenas jogadores premium account podem usar essa alavanca.")
    end
end


subsolo:aid(1401)
subsolo:register()

