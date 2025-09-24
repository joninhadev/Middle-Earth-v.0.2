local premiumScroll = Action()

local days = 30
local scroll = 16101

function premiumScroll.onUse(player, item)

    player:addPremiumDays(days)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu 30 dias de premium account!")
    player:getPosition():sendMagicEffect(28)
    item:remove(1)
end

premiumScroll:id(scroll)
premiumScroll:register()