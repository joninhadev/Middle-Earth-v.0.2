local msgMPA = MoveEvent()

function msgMPA.onEquip(player, item, slot)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você equipou a lendária Magic Plate Armor!")
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    return true
end

msgMPA:id(2472) -- ID do item específico
msgMPA:register()
