function onSay(player, words, param)
    local message = ""
    
    local expBoostTime = player:getExpBoostStamina()
    if player:getStoreXpBoost() > 0 and expBoostTime > 0 then
        message = "Você ainda tem: " .. math.floor(expBoostTime / 60) .. " minutos de XP Boost ativos."
    else
        message = "Você não tem XP Boost ativa."
    end

    player:showTextDialog(2036, message)
    return false
end
