local keySlime = Action()

local goldenKey = 2091
local goldenKeyAid = 666
local estatuaUid = 1300
local newpos = Position(516, 544, 8)

function keySlime.onUse(player, item, position, target)
    
    if item:getId() == goldenKey then 
        if target and target:getUniqueId() == estatuaUid then 
            player:teleportTo(newpos) 
            player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        return true
        end
    end
end

keySlime:aid(666)
keySlime:register()