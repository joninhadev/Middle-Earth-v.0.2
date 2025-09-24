local vibrant = Action()

function vibrant.onUse(player, item, itemEx, toPosition)
    if player:hasMount(162) then
        player:sendTextMessage(19, "Seu personagem já contém essa montaria.")
    else
        player:addMount(162)
        item:remove(1)
        player:sendTextMessage(19, "Você montou em um Haze com sucesso.")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
    end
end

vibrant:id(37355)
vibrant:register()