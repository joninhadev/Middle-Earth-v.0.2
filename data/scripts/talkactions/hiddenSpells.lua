local storageHiddenSpells = 256331

local hiddenSpellsTalk = TalkAction("!hiddenspells")

function hiddenSpellsTalk.onSay(player, words, param)
    local current = player:getStorageValue(storageHiddenSpells)
    if current ~= 1 then
        player:setStorageValue(storageHiddenSpells, 1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Modo de magias ocultas ativado.")
    else
        player:setStorageValue(storageHiddenSpells, -1)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Modo de magias ocultas desativado.")
    end
    return false
end

hiddenSpellsTalk:register()
