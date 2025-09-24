local spiritualHorse = Action()

local horseShoeId = 49451

function spiritualHorse.onUse(player, item, itemEx, toPosition)
    if player:hasMount(217) then
        player:sendTextMessage(MESSAGE_EVENT_DEFAULT, "Seu personagem já possui o Spirit of Purity.")
    else
        if player:getItemCount(horseShoeId) >= 2 then
            player:removeItem(horseShoeId, 2)
            player:addMount(217)
            player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Você adquiriu o Spirit of Purity!")
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Você precisa de 2 Spiritual Horse Shoes.")
        end
    end
    return true
end

spiritualHorse:id(49451)
spiritualHorse:register()
