local riftrunner = Action()

function riftrunner.onUse(player, item, itemEx)

    if player:hasMount(87) then
        player:sendTextMessage(19, "Voc� j� foi amaldi�oado pelo Rift Runner.")
    else
        player:addMount(87)
        item:remove(1)
        player:sendTextMessage(19, "Voc� foi amaldi�oado pelo Rift Runner!")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
    end
end

riftrunner:id(25521)
riftrunner:register()