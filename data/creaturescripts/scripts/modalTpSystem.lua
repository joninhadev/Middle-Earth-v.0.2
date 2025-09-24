local function check_cond(p, t)
    if not t then
        p:sendCancelMessage("Destino inválido.")
        return false
    end

    if t.paid and not p:removeMoney(t.cost) then
        p:sendCancelMessage(TP_MODAL_SYSTEM.messages.not_enough_money:format(t.cost))
        return false
    end

    p:getPosition():sendMagicEffect(CONST_ME_POFF)
    p:teleportTo(t.position)
    p:getPosition():sendMagicEffect(CONST_ME_BATS)
    return true
end

function onModalWindow(player, modalWindowId, buttonId, choiceId)
    player:unregisterEvent("Modal_tpsystem")

    if modalWindowId ~= TP_MODAL_SYSTEM.id then
        return false
    end

    if buttonId == 101 then -- Se o jogador clicar em "Teleport"
        local destination = TP_MODAL_SYSTEM.locais[choiceId]

        if not destination and TP_MODAL_SYSTEM.player_houses[player:getGuid()] then
            destination = TP_MODAL_SYSTEM.player_houses[player:getGuid()][choiceId - #TP_MODAL_SYSTEM.locais]
        end

        check_cond(player, destination)
    end

    return true
end
