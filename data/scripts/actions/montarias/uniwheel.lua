local uniwheel = Action()

local goldenCan = 13938
local uniwheelI = 13937

function uniwheel.onUse(player, item, position, target)

    if item:getId() == goldenCan then
        if target and target:getId() == uniwheelI then
            if player:hasMount(15) then
                player:sendTextMessage(19, "Voc� j� ativou a Uniwheel.")
            else
                player:addMount(15)
                player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_RED)
                player:sendTextMessage(19, "Inoperative Uniwheel ativada com sucesso!")
                item:remove(1)
            end
        else
            player:sendTextMessage(19, "Voc� s� pode usar o �leo na Inoperative Uniwheel.")
        end
    end
end

uniwheel:id(13938)
uniwheel:register()