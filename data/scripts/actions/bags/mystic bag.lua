local mysticBag = Action()

local itens = {
	{name = "Firewalker Boots", id = 9933},
	{name = "Divine Cuirass", id = 9776},
	{name = "Legolas Plate", id = 8891},
	{name = "Golden Legs", id = 2470},
	{name = "Magic Plate Armor", id = 2472},
	{name = "Great Shield", id = 2522},
	{name = "Blessed Shield", id = 2523},
	{name = "Golden Boots", id = 2646},
	{name = "Golden Helmet", id = 2471},
}

function mysticBag.onUse(player, item)

local rewardIndex = math.random(1, #itens)
local rewardItem = itens[rewardIndex]

		player:addItem(rewardItem.id, 1)
		player:sendTextMessage(22, "Você abriu uma mystic bag e obteve o item: " .. string.lower(rewardItem.name) .. ".")
		player:getPosition():sendMagicEffect(244)
		item:remove(1)
end


mysticBag:id(57444)
mysticBag:register()
