function onStepIn(player, item, position, fromPosition, toPosition)
if player:getLevel() < 50 then
doTeleportThing(player, fromPosition)
end
end