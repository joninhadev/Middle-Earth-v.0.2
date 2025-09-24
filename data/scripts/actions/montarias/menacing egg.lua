local vibrant = Action()

function vibrant.onUse(player, item, itemEx, toPosition)
    if player:hasMount(99) then
        player:sendTextMessage(19, "Seu personagem já utilizou este item.")
    else
        player:addMount(99)
        item:remove(1)
        player:sendTextMessage(19, "Você recebeu permissão para montar no Vortexion.")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
    end
end

vibrant:id(26341)
vibrant:register()