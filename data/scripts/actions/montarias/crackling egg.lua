local crackling = Action()

function crackling.onUse(player, item, itemEx, toPosition)
    if player:hasMount(98) then
        player:sendTextMessage(19, "Seu personagem j� utilizou este item.")
    else
        player:addMount(98)
        item:remove(1)
        player:sendTextMessage(19, "Voc� recebeu permiss�o para montar no Neon Sparkid.")
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
    end
end

crackling:id(26340)
crackling:register()