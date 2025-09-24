local teleports = {
    [4919] = { -- AID 4919
        oldpos = Position(2120, 347, 9),
        newpos = Position(2141, 355, 10)
    },
    [4920] = { -- AID 4920
        oldpos = Position(2141, 355, 10),
        newpos = Position(2120, 347, 9)
    }
}

local sparkTeleport = MoveEvent()

function sparkTeleport.onStepIn(player, item, position, fromPosition)
    local cfg = teleports[item.actionid]
    if not cfg then
        return true
    end

    if player:getLevel() > 150 then
        player:teleportTo(cfg.newpos)
        cfg.newpos:sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você precisa ser level 150 ou mais para entrar neste portal.")
        player:teleportTo(cfg.oldpos)
        cfg.oldpos:sendMagicEffect(CONST_ME_POFF)
    end
    return true
end

for aid, _ in pairs(teleports) do
    sparkTeleport:aid(aid)
end
sparkTeleport:register()
