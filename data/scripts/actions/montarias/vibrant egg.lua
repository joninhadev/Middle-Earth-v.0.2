local vibrant = Action()

function vibrant.onUse(player, item, itemEx, toPosition)
    if player:hasMount(94) then
        player:sendTextMessage(19, "Seu personagem j� utilizou este item.")
    else
        player:addMount(94)
        item:remove(1)
        player:sendTextMessage(19, "Voc� recebeu permiss�o para montar no Sparkion.")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
    end
end

vibrant:id(26194)
vibrant:register()