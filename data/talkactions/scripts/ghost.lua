function onSay(player, words, param)
    -- 🔒 Permitir apenas grupos 5 (GM) e 6 (GOD)
    local groupId = player:getGroup():getId()
    if groupId ~= 5 and groupId ~= 6 then
        --player:sendCancelMessage("Apenas GM e GOD podem usar este comando.")
        return false
    end

    local position = player:getPosition()
    local isGhost = not player:isInGhostMode()

    player:setGhostMode(isGhost)
    if isGhost then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are now invisible.")
        position:sendMagicEffect(CONST_ME_YALAHARIGHOST)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are visible again.")
        position.x = position.x + 1
        position:sendMagicEffect(CONST_ME_SMOKE)
    end
    return false
end
