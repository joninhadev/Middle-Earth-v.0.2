function onSay(player, words, param)
	local monsterType = MonsterType(param)
	
    local purse = player:getSlotItem(CONST_SLOT_STORE_INBOX)
	if purse and purse:isContainer() then
        local item26377 = findContainerItem(purse, 26377)
        if not item26377 then
			player:sendCancelMessage("You need a loot pouch.")
			return false
		end
	end
	
	if not monsterType then
		player:sendCancelMessage("Can't find monster.")
		return false
	end

	player:registerEvent('autoloot')
	local title = "Autoloot"
    local message = "Loots of "..string.gsub(" "..string.lower(param), "%W%l", string.upper):sub(2)..":"
	local lootBlockList = monsterType:getLoot()
	table.sort(lootBlockList, function(a, b) return ItemType(a.itemId):getName() < ItemType(b.itemId):getName() end)

		lootBlockListm[getPlayerGUID(player)] = lootBlockList
	lootBlockListn[getPlayerGUID(player)] = param

	local window = ModalWindow(1001, title, message)
	local check, sum = {}, 1
	for _, loot in pairs(lootBlockList) do
		local status = ''
		if player:getAutoLootItem(lootBlockList[sum].itemId) then
			status = '*'
		end
		if not table.contains(check, ItemType(lootBlockList[sum].itemId):getName()) then
			table.insert(check, ItemType(lootBlockList[sum].itemId):getName())
			local resultId = db.storeQuery('SELECT `cont_id` FROM `player_autoloot_persist` WHERE `player_guid` = ' .. getPlayerGUID(player) .. ' AND `item_id` = ' .. lootBlockList[sum].itemId .. '')
			if resultId then
			local bp_id = result.getNumber(resultId, 'cont_id')
			end

			local backvinculo

			if result.getNumber(resultId, 'cont_id') and result.getNumber(resultId, 'cont_id') > 0 then
			backvinculo = '| '..ItemType(result.getNumber(resultId, 'cont_id')):getName()..''
			else
			backvinculo = ''
			end
			window:addChoice(sum, "".. string.gsub(" "..status..""..ItemType(lootBlockList[sum].itemId):getName(), "%W%l", string.upper):sub(2, 21) .."")
		end
		sum = sum + 1
	end
	--window:addButton(105, "Backpack")
	window:setDefaultEnterButton(103, "Add")
	window:addButton(100, "Confirm")
	if autolootBP == 1 then
	window:addButton(102, "Remove")
	end
	window:addButton(103, "Add")

	window:sendToPlayer(player)
	return false
end