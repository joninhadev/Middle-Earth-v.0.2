local scarlettBag = Action()

local allItems = {
    {name = "Cobra Amulet", id = 36345},
    {name = "Cobra Axe", id = 35110},
    {name = "Cobra Sword", id = 35112},
    {name = "Cobra Club", id = 35109},
    {name = "Cobra Hood", id = 35111},
    {name = "Cobra Boots", id = 35108},
    {name = "Cobra Crossbow", id = 35107},
    {name = "Cobra Wand", id = 35113},
    {name = "Cobra Rod", id = 35114}
}

function scarlettBag.onUse(player, item)
    local rewardIndex = math.random(1, #allItems)
    local chosenItem = allItems[rewardIndex]

    player:addItem(chosenItem.id, 1)
    player:sendTextMessage(22, "Você abriu uma cobra bag e obteve o item: " .. string.lower(chosenItem.name) .. ".")
    player:getPosition():sendMagicEffect(244)
    item:remove(1)
end

scarlettBag:id(57470)
scarlettBag:register()
