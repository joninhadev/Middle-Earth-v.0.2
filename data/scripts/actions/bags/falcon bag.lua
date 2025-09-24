local falconBag = Action()

local allItems = {
    {name = "Falcon Plate", id = 33221},
    {name = "Falcon Battleaxe", id = 33226},
    {name = "Falcon Mace", id = 33227},
    {name = "Falcon Longsword", id = 33225},
    {name = "Falcon Greaves", id = 33222},
    {name = "Falcon Shield", id = 33223},
    {name = "Falcon Coif", id = 33217},
    {name = "Falcon Bow", id = 33220},
    {name = "Falcon Wand", id = 33219},
    {name = "Falcon Rod", id = 33218},
    {name = "Falcon Circlet", id = 33216}
}

function falconBag.onUse(player, item)
    local rewardIndex = math.random(1, #allItems)
    local chosenItem = allItems[rewardIndex]

    player:addItem(chosenItem.id, 1)
    player:sendTextMessage(22, "Você abriu uma falcon bag e obteve o item: " .. string.lower(chosenItem.name) .. ".")
    player:getPosition():sendMagicEffect(244)
    item:remove(1)
end

falconBag:id(57468)
falconBag:register()
