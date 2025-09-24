local talk = TalkAction("/prey")

local storageLOCK = 53333
local storageDISCOUNT = 53334
local amountDiscount = 5
local price = 5
local msgNoCard = "Você não tem prey wildcards para executar esse comando."
local msgactive = "PREY bônus está ativo."


function talk.onSay(player, words, param)
        
                local preyWildCards = player:getBonusRerollCount()
        if (preyWildCards <= 4) then
                player:sendCancelMessage(msgNoCard)
                        return false
        end
            
            if player:getStorageValue(storageLOCK) == -1 then
                player:setStorageValue(storageLOCK, 0)
            end    

            if player:getStorageValue(storageDISCOUNT) == -1 then
                 player:setStorageValue(storageDISCOUNT, 0)
            end


            if player:getStorageValue(storageDISCOUNT) < amountDiscount then
                local amount = player:getBonusRerollCount()
                if amount <= 4 then
                    player:setStorageValue(storageDISCOUNT, player:getStorageValue(storageDISCOUNT) + 1)
                    player:setStorageValue(storageLOCK, 1)
                    player:setBonusRerollCount(player:getBonusRerollCount() - price)
                end
                    player:setStorageValue(storageLOCK, player:getStorageValue(storageLOCK)+1)
                    player:setBonusRerollCount(player:getBonusRerollCount() - price)
                    print("4")
                    player:sendCancelMessage("AMOUNT PREY BONUS: "..player:getStorageValue(storageLOCK).." ")
                        else
                    player:setStorageValue(storageLOCK, 1)
                    player:setBonusRerollCount(player:getBonusRerollCount() - price)
                    player:setStorageValue(storageDISCOUNT, 0)
                    print("3")
                                end
        return false
end

talk:separator("")
talk:register()