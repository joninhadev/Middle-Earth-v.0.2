local riftrunner = Action()

function riftrunner.onUse(player, item, itemEx)

    if player:hasMount(87) then
        player:sendTextMessage(19, "Você já foi amaldiçoado pelo Rift Runner.")
    else
        player:addMount(87)
        item:remove(1)
        player:sendTextMessage(19, "Você foi amaldiçoado pelo Rift Runner!")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
    end
end

riftrunner:id(25521)
riftrunner:register()