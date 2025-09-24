local config = {
    [9033] = {flamePosition = Position(1566, 1200, 7), toPosition = Position(1557, 1204, 7)}
}

function onAddItem(moveitem, tileitem, position)
    local campfire = config[tileitem.uid]
    if not campfire then
        return true
    end

    if moveitem.itemid ~= 21252 then
        position:sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Remove o item e exibe o efeito de fogo
    moveitem:remove()
    position:sendMagicEffect(CONST_ME_HITBYFIRE)

    -- Teletransporta o item para a nova posição
    Tile(campfire.flamePosition):relocateTo(campfire.toPosition)
    campfire.toPosition:sendMagicEffect(CONST_ME_TELEPORT)

    return true
end
