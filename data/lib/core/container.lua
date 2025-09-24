function Container.isContainer(self)
	return true
end

--[[
	return values for autoloot
	0 = Did not drop the item. No error
	-1 = For some reason, the item can not be created.
	> 0 = UID
]]
function Container.getItems(self, ret)
    ret = ret or {}
    for index = self:getSize()-1, 0, -1 do
        local item = self:getItem(index)
        if ItemType(item:getId()):isContainer() then
            ret[#ret+1] = item
            item:getItems(ret)
        else
            ret[#ret+1] = item
        end
    end
    return ret
end

function Container.getAllItemsInside(self)
    local itemList = {}
    if self:isContainer() then
        local size = self:getSize()
        for slot=0, size-1 do
            local item = self:getItem(slot)
            if (item) then
                if(item:isContainer()) then
                    itemList = TableConcat(itemList, item:getAllItemsInside())
                end
                itemList[#itemList+1] = item:getId()
            end
        end
    end
    return itemList
end
function Container.createLootItem(self, item)
	if self:getEmptySlots() == 0 then
	       return 0
	end

	local itemCount = 0
  
	local randvalue = getLootRandom()
	if randvalue < item.chance then
		if ItemType(item.itemId):isStackable() then
			itemCount = randvalue % item.maxCount + 1
		else
			itemCount = 1
		end
	end

	local tmpItem = false
	if itemCount > 0 then
		tmpItem = self:addItem(item.itemId, math.min(itemCount, 100))
		if not tmpItem then
			return -1
		end

		if tmpItem:isContainer() then
			for i = 1, #item.childLoot do
				if not tmpItem:createLootItem(item.childLoot[i]) then
					tmpItem:remove()
					return -1
				end
			end
		end
		if item.subType ~= -1 then
			tmpItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, item.subType)
		end
		if item.actionId ~= -1 then
			tmpItem:setActionId(item.actionId)
		end
		if item.text and item.text ~= "" then
			tmpItem:setText(item.text)
		end
	end

	return tmpItem and tmpItem.uid or 0
end

function Container.getLootDescription(self, monsterName, version, bonusPrey, hasCharm)
	if not bonusPrey then
		bonusPrey = 0
	end
	local hasParent = false
	local txt = ''
	if bonusPrey > 0 then
		txt = ' (prey bonus active'
		hasParent = true
	end

	if hasCharm then
		if not hasParent then
			txt = txt .. ' ('
			hasParent = true
		else
			txt = txt .. ' and '
		end
		txt = txt .. 'active charm \'Gut\''
	end

	if hasParent then
		txt = txt .. ')'
	end

	local str = {("Loot of %s%s: "):format(monsterName, txt)}
	local firstitem = true
	for i = self:getSize() - 1, 0, -1 do
		local containerItem = self:getItem(i)
		if containerItem then
			local str1 = ''
			if (firstitem) then
				firstitem = false
			else
				str1 = string.format(", ")
			end

			table.insert(str, string.format("%s%s", str1, containerItem:getNameLoot(version)))
		end
	end

	if (firstitem) then
		table.insert(str, string.format("nothing"))
	end

	return str
end

function Container.getLoot(self, mname, version, bonusPrey, hasCharm)
	local text = table.concat(self:getLootDescription(mname, version, bonusPrey, hasCharm))
	return text
end
