local lionBag = Action()

local allItems = {
    {name = "Lion Shield", id = 39558},
    {name = "Lion Longsword", id = 39559},
    {name = "Lion Hammer", id = 39657},
    {name = "Lion Plate", id = 39561},
    {name = "Lion Sacred Amulet", id = 39562},
    {name = "Lion Longbow", id = 39554},
    {name = "Lion Helmet", id = 39560},
    {name = "Lion Rod", id = 39555},
    {name = "Lion Wand", id = 39556},
    {name = "Lion Spellbook", id = 39557}
}

function lionBag.onUse(player, item)
    local rewardIndex = math.random(1, #allItems)
    local chosenItem = allItems[rewardIndex]

    player:addItem(chosenItem.id, 1)
    player:sendTextMessage(22, "Você abriu uma lion bag e obteve o item: " .. string.lower(chosenItem.name) .. ".")
    player:getPosition():sendMagicEffect(244)
    item:remove(1)
end

lionBag:id(57467)
lionBag:register()
