function onStepIn(player, item, position, fromPosition)
position = Position(1951,439,13)
player:teleportTo(position)
player:sendTextMessage(22, "Bem vindo a outra dimensão.")
return true
end