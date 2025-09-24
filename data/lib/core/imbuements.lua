MESSAGEDIALOG_IMBUEMENT_ERROR = 1
MESSAGEDIALOG_IMBUEMENT_ROLL_FAILED = 2
MESSAGEDIALOG_IMBUING_STATION_NOT_FOUND = 3
MESSAGEDIALOG_CLEARING_CHARM_SUCCESS = 10
MESSAGEDIALOG_CLEARING_CHARM_ERROR = 11

-- TABELA DE ITENS IMBUÍVEIS.
Imbuements_Weapons = {
	["armor"] = {8888, 8883, 8884, 8881, 8882, 8878, 3968, 2492, 8867, 2494, 11356, 11301, 8879, 2466, 8880, 18404, 8889, 2472, 8891, 9776, 8885, 8886, 8887, 2505, 2503, 21725, 36297, 15406, 30883, 37354, 33221, 25187, 25188, 25189, 25186, 25176, 25179, 25182, 25185, 25190, 25192, 25193, 25191}, -- ARMORS OK!
	["shield"] = {18410, 2522, 12644, 2523, 6433, 6391, 33223, 33224}, 
	["boots"] = {}, 
	["helmet"] = {10016, 7902, 2499, 2502, 2491, 3972, 2475, 2497, 2342, 5741, 2498, 2501, 2474, 7901, 2496, 2506, 10316, 2493, 12630, 11302, 18403, 12645, 2471, 24718, 35111, 33217, 33216, 36296, 30882, 36291, 15408}, -- HELMETS OK!
	["helmetmage"] = {}, 
	["bow"] = {15643, 8855, 39554, 36295, 33220, 39492}, -- BOWS OK!
	["crossbow"] = {8852, 15644, 35107, 39493}, -- CROSSBOW OK!
	["backpack"] = {},
	["wand"] = {}, -- WANDS OK! 
	["rod"] = {}, -- RODS OK!
	["axe"] = {18451, 8924, 8925, 35110, 39656, 33226, 30687, 39488, 39489, 37342}, -- AXES OK!
	["club"] = {15414, 7414, 7882, 35109, 39657, 33227, 30689, 39490, 39491, 33912, 36294}, -- CLUBS OK!
	["sword"] = {18465, 6528, 8931, 35112, 39559, 33225, 30685, 39486, 39487, 33914, 33915}, -- SWORDS OK! 
	["spellbooks"] = {}, 
	["especial"] = {7424, 35114, 39555, 33218, 39495, 35113, 39556, 33219, 39494} -- WEAPONS OF DESTRUCTION

}

local equipitems = {
	["lich shroud"] = {"armor", "spellbooks","shield"},
	["reap"] = {"axe", "club", "sword"},
	["vampirism"] = {"axe", "club", "sword", "wand", "rod", "especial", "bow", "crossbow", "armor"},
	["cloud fabric"] = {"armor", "spellbooks","shield"},
	["electrify"] = {"axe", "club", "sword"},
	["swiftness"] = {"boots"},
	["snake skin"] = {"armor", "spellbooks","shield"},
	["venom"] = {"axe", "club", "sword"},
	["slash"] = {"sword", "helmet"},
	["chop"] = {"axe", "helmet"},
	["bash"] = {"club", "helmet"},
	["hide dragon"] = {"armor", "spellbooks","shield"},
	["scorch"] = {"axe", "club", "sword"},
	["void"] = {"axe", "club", "sword", "wand", "rod", "especial", "bow", "crossbow", "helmet","helmetmage"},
	["quara scale"] = {"armor", "spellbooks","shield"},
	["frost"] = {"axe", "club", "sword"},
	["blockade"] = {"shield", "helmet", "spellbooks","shield"},
	["demon presence"] = {"armor", "spellbooks","shield"},
	["precision"] = {"bow", "crossbow", "helmet"},
	["strike"] = {"axe", "club", "sword", "bow", "crossbow", "especial"},
	["epiphany"] = {"wand", "rod", "helmetmage", "especial"},
	["featherweight"] = {"backpack"},
}

local enablingStorages = {

}

function Player.canImbueItem(self, imbuement, item)
	local item_type = ""
	for tp, items in pairs(Imbuements_Weapons) do
		if isInArray(items, item:getId()) then
			item_type = tp
			break
		end
	end
	local imb_type = ""
	for ibt, imb_n in pairs(enablingStorages) do
		if string.find(ibt, imbuement:getName():lower()) then
			imb_type = ibt
			break
		end
	end
	if imb_type == "" then
		print(">> [Imbuement::canImbueItem] Error on search imbuement '".. imbuement:getName() .. "'")
		return false
	end

	local equip = equipitems[imb_type]
	if not equip then
		print(">> [Imbuement::canImbueItem] Error on search Weapons imbuement '" .. imbuement:getName() .. "'")
		return false
	end

	local imbuable = false
	for i, p in pairs(equip) do
		if p:lower() == item_type then
			imbuable = true
			break
		end
	end
	if not imbuable then
		return false
	end
	local stg = enablingStorages[imb_type]
	if not stg then
		print(">> [Imbuement::canImbueItem] Error on search Storage imbuement '" .. imbuement:getName() .. "'")
		return false
	end

	return true
end

-- Player functions
function Player.sendImbuementResult(self, errorType, message)
	local msg = NetworkMessage()
	msg:addByte(0xED)
	msg:addByte(errorType or 0x01)
	msg:addString(message)
	msg:sendToPlayer(self)
	msg:delete()
	return
end

function Player.closeImbuementWindow(self)
	local msg = NetworkMessage()
	msg:addByte(0xEC)
	msg:sendToPlayer(self)
end

-- Items functions
function Item.getImbuementDuration(self, slot)
	local info = 0
	local binfo = tonumber(self:getCustomAttribute(IMBUEMENT_SLOT + slot))
	if binfo then
		info = bit.rshift(binfo, 8)
	end

	return info
end

function Item.getImbuement(self, slot)
	local binfo = tonumber(self:getCustomAttribute(IMBUEMENT_SLOT + slot))
	if not binfo then
		return false
	end
	local id = bit.band(binfo, 0xFF)
	if id == 0 then
		return false
	end

	local info = bit.rshift(binfo, 8)
	if info <= 0 then
		return false
	end

	return Imbuement(id)
end

function Item.addImbuement(self, slot, id, duration)
	local imbuement = Imbuement(id)
	if not imbuement then return false end
	if not duration then
		duration = imbuement:getBase().duration
	end

	local imbue = bit.bor(bit.lshift(duration, 8), id)
	self:setCustomAttribute(IMBUEMENT_SLOT + slot, imbue)
	return true
end

function Item.cleanImbuement(self, slot)
	self:setCustomAttribute(IMBUEMENT_SLOT + slot, 0)
	return true
end
