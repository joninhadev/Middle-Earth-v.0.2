local ferumbrasAscendant = CreatureEvent("ferumbrasAscendant")

local tpId = 12509
local tps = {
        ["Ferumbras"] = {pos = {x = 1865, y = 810, z = 0}, toPos = {x = 1210, y = 556, z = 10}, time = 60},
}

function removeTp(tp)
        local t = getTileItemById(tp.pos, tpId)
        if t then
                doRemoveItem(t.uid, 1)
                doSendMagicEffect(tp.pos, CONST_ME_POFF)
        end
end
 
function ferumbrasAscendant.onDeath(player)
        local tp = tps[getCreatureName(player)]
        if tp then
                doCreateTeleport(tpId, tp.toPos, tp.pos)
                doCreatureSay(player, "O teleport irá sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
                addEvent(removeTp, tp.time*1000, tp)
        end
        return TRUE
end

ferumbrasAscendant:register()