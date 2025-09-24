local tinLizard = Action ()

local tinKey = 13292
local tinLizardI = 13306

function tinLizard.onUse(player, item, position, target)

    if item:getId() == tinKey then
        if target and target:getId() == tinLizardI then 
            if player:hasMount(8) then
                player:sendTextMessage(19, "Seu personagem j� possui essa montaria.")
            else
                player:addMount(8)
                player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
                player:sendTextMessage(19, "Voc� ativou a Inoperative Tin Lizzard!")
                item:remove(1)
            end
        else
            player:sendTextMessage(19, "Voc� s� pode usar essa chave na Inoperative Tin Lizzard.")
        end
    end
end

tinLizard:id(13292)
tinLizard:register()