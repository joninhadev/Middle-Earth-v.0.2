local config = {
	leverUniqueId = 18569,
	signActionId = 39633,
	positionRequired = Position(107, 646, 5),

	lever = {
		left = 9825,
		right = 9826,
	},

	playItem = {
		itemId = 57450,
		tokenRequired = 1,
	},

	rouletteOptions = {
		ignoredItems = { 42218, 42337 },
		winEffects = { CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE },
		effectDelay = 333,
		spinTime = { min = 6, max = 8 },
		spinSlowdownRamping = 5,
		usageStorage = 48550,
		spinInProgressStorage = 48551,
	},

	prizeCategories = {
		common = {
			items = {
			--  { itemId = 31720, count = 1 }, -- Strawberry Cupcake
				{ itemId = 31719, count = 1 }, -- Blueberry Cupcake
				{ itemId = 10513, count = 1 }, -- Canivete Rosa
				{ itemId = 57445, count = 1 }, -- Bless
				{ itemId = 5804, count = 1 }, -- Nose Ring
				{ itemId = 2466, count = 1 }, -- Golden Armor
				{ itemId = 7730, count = 1 }, -- Blue Legs
				{ itemId = 11302, count = 1 }, -- Zenit Helmet
			--	{ itemId = 15643, count = 1 }, -- Hive Bow
			--	{ itemId = 57483, count = 1 }, -- Sparkless
			--  { itemId = 57485, count = 1 }, -- Sparkless
							
			},
		},

		rare = {
			items = {
				{ itemId = 57411, count = 1 }, -- Red Remover
				{ itemId = 57428, count = 1 }, -- Skull Backpack
				{ itemId = 57440, count = 1 }, -- Buozi Backpack
				{ itemId = 57443, count = 1 }, -- Mountbox
				{ itemId = 57448, count = 1 }, -- Food
				{ itemId = 6132, count = 1 }, -- Soft Boots
				{ itemId = 8877, count = 1 }, -- PPA
				{ itemId = 57449, count = 1 }, -- Exercise Box
				--{ itemId = 57452, count = 1 }, -- Nephilim Wings
				{ itemId = 57484, count = 1 }, -- Sparkless
				{ itemId = 57450, count = 1 }, -- Token
				{ itemId = 42121, count = 1 }, -- Elixir de Exp
				{ itemId = 42451, count = 1 }, -- Adventurer's Doll
				{ itemId = 45152, count = 1 }, -- Divine Doll
				{ itemId = 45150, count = 1 }, -- Snow Doll
				{ itemId = 41872, count = 1 }, -- Pyro Doll
				{ itemId = 28310, count = 1 }, -- Darkness Doll
				{ itemId = 37646, count = 1 }, -- Venom Doll
				{ itemId = 24331, count = 1 }, -- Vortex Doll
			--	{ itemId = 25376, count = 1 }, -- Iron Token
			--	{ itemId = 25379, count = 1 }, -- Platinum Token
			},

			count = 3,
		},

		superRare = {
			items = {
				{ itemId = 42119, count = 1 }, -- Stamina
				{ itemId = 5804, count = 1 }, -- Nose Ring
				{ itemId = 57444, count = 1 }, -- Mystic Bag
				{ itemId = 57467, count = 1 }, -- Lion Bag
				{ itemId = 57468, count = 1 }, -- Falcon Bag
				{ itemId = 57470, count = 1 }, -- Cobra Bag
				{ itemId = 2522, count = 1 }, -- Great Shield
				{ itemId = 9933, count = 1 }, -- Firewalker Boots
				{ itemId = 8886, count = 1 }, -- Molten Plate
				{ itemId = 8887, count = 1 }, -- Frozen Plate
				{ itemId = 8885, count = 1 }, -- Divine Plate
				
			},

			count = 1,
		},
	},

	roulettePositions = {
		Position(101, 642, 6),
		Position(102, 642, 6),
		Position(103, 642, 6),
		Position(104, 642, 6),
		Position(105, 642, 6),
		Position(106, 642, 6),
		Position(107, 642, 6),
		Position(108, 642, 6),
		Position(109, 642, 6),
		Position(110, 642, 6),
		Position(111, 642, 6),
	},

	totalSlots = 11,
	prizePosition = 6,
}

local function resetLever(position)
	local lever = Tile(position):getItemById(config.lever.right)
	if lever then
		lever:transform(config.lever.left)
	end
end

local function updateRoulette(newItemInfo)
	local positions = config.roulettePositions
	for i = #positions, 1, -1 do
		local item = Tile(positions[i]):getTopVisibleThing()
		if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
			if i ~= config.totalSlots then
				item:moveTo(positions[i + 1])
			else
				item:remove()
			end
		end
	end

	Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[1])
end

local function clearRoulette(newItemInfo)
	local positions = config.roulettePositions
	for i = #positions, 1, -1 do
		local item = Tile(positions[i]):getTopVisibleThing()
		if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
			item:remove()
		end

		if newItemInfo then
			Game.createItem(newItemInfo.itemId, newItemInfo.count, positions[i])
		else
			positions[i]:sendMagicEffect(CONST_ME_POFF)
		end
	end
end

local function chanceNewReward()
	local rewardCandidates = {}
	local remainingSlots = config.totalSlots - (config.prizeCategories.rare.count + config.prizeCategories.superRare.count)

	local commonItemIds = {}
	for i = 1, remainingSlots do
		local itemIndex = math.random(1, #config.prizeCategories.common.items)
		local item = config.prizeCategories.common.items[itemIndex]
		table.insert(commonItemIds, item.itemId)
		table.insert(rewardCandidates, item)
	end

	local rareItemIds = {}
	for i = 1, config.prizeCategories.rare.count do
		local itemIndex = math.random(1, #config.prizeCategories.rare.items)
		local item = config.prizeCategories.rare.items[itemIndex]
		table.insert(rareItemIds, item.itemId)
		table.insert(rewardCandidates, item)
	end

	local superRareItemIds = {}
	for i = 1, config.prizeCategories.superRare.count do
		local itemIndex = math.random(1, #config.prizeCategories.superRare.items)
		local item = config.prizeCategories.superRare.items[itemIndex]
		table.insert(superRareItemIds, item.itemId)
		table.insert(rewardCandidates, item)
	end

	--logger.debug("Drawn items: Common: " .. table.concat(commonItemIds, ", ") .. " | Rare: " .. table.concat(rareItemIds, ", ") .. " | Super Rare: " .. table.concat(superRareItemIds, ", "))

	local selectedItem = rewardCandidates[math.random(1, #rewardCandidates)]
	return { itemId = selectedItem.itemId, count = selectedItem.count }
end

local function initiateReward(leverPosition, effectCounter)
	if effectCounter < #config.rouletteOptions.winEffects then
		effectCounter = effectCounter + 1
		for i, pos in ipairs(config.roulettePositions) do
			if effectCounter == 1 and i == config.prizePosition then
				config.roulettePositions[config.totalSlots]:sendDistanceEffect(pos, config.rouletteOptions.winEffects[1])
			else
				pos:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
			end
		end

		if effectCounter == 2 then
			local item = Tile(config.roulettePositions[config.prizePosition]):getTopVisibleThing()
			local newItemInfo = { itemId = item:getId(), count = item:getCount() }
			clearRoulette(newItemInfo)
		end

		addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
		return
	end

	resetLever(leverPosition)
end

local function rewardPlayer(playerId, leverPosition)
	local player = Player(playerId)
	if not player then
		return
	end

	local item = Tile(config.roulettePositions[config.prizePosition]):getTopVisibleThing()
	local inbox = player:getInbox()

	if inbox then
		inbox:addItem(item:getId(), item:getCount(), INDEX_WHEREEVER, FLAG_NOLIMIT)
	end

	local itemType = ItemType(item:getId())
	local itemName = itemType:getArticle() .. " " .. itemType:getName()

	player:setStorageValue(config.rouletteOptions.usageStorage, -1)
	player:setStorageValue(config.rouletteOptions.spinInProgressStorage, -1)
	player:setMoveLocked(false)
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You have won " .. itemName .. ". The item has been sent to your inbox.")
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
	local player = Player(playerId)
	if not player then
		resetLever(leverPosition)
		return
	end

	local newItemInfo = chanceNewReward()
	updateRoulette(newItemInfo)

	if spinTimeRemaining > 0 then
		spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
		addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
		return
	end

	initiateReward(leverPosition, 0)
	rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local needPosition = config.positionRequired
	if player:getPosition() ~= needPosition then
		needPosition:sendMagicEffect(CONST_ME_TUTORIALARROW)
		player:say("Please stand on the correct tile to use this lever.", TALKTYPE_MONSTER_SAY)
		return true
	end

	if item:getId() == config.lever.right then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Casino Roulette is currently in progress. Please wait.")
		return true
	end

	local usageStorage = player:getStorageValue(config.rouletteOptions.usageStorage) or 0
	local tokenCount = player:getItemCount(config.playItem.itemId)

	if tokenCount < config.playItem.tokenRequired and usageStorage < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Casino Roulette requires " .. config.playItem.tokenRequired .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to use.")
		return true
	end

	item:transform(config.lever.right)
	clearRoulette()

	if usageStorage < 1 then
		player:removeItem(config.playItem.itemId, config.playItem.tokenRequired)
	end

	player:setStorageValue(config.rouletteOptions.usageStorage, 1)
	player:setStorageValue(config.rouletteOptions.spinInProgressStorage, 1)
	player:setMoveLocked(true)

	local spinTimeRemaining = math.random(config.rouletteOptions.spinTime.min * 1000, config.rouletteOptions.spinTime.max * 1000)
	roulette(player:getId(), toPosition, spinTimeRemaining, 100)
	return true
end

casinoRoulette:uid(config.leverUniqueId)
casinoRoulette:register()





local function formatPrizes(prizes, categoryName)
	local formattedText = categoryName .. ":\n"
	for _, prize in ipairs(prizes) do
		local itemName = ItemType(prize.itemId):getName()
		formattedText = formattedText .. itemName .. "\n"
	end

	formattedText = formattedText .. "\n"
	return formattedText
end

local rouletteSign = Action()

function rouletteSign.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local message = "Os itens listados abaixo refletem a configuração atual da roleta e são atualizados automaticamente. Para qualquer dúvida sobre as recompensas, entre em contato com a administração.\n\n"

	message = message .. formatPrizes(config.prizeCategories.common.items, "Itens comuns")
	message = message .. formatPrizes(config.prizeCategories.rare.items, "Itens raros")
	message = message .. formatPrizes(config.prizeCategories.superRare.items, "Itens super raros")

	player:showTextDialog(item:getId(), message)
	return true
end

rouletteSign:aid(config.signActionId)
rouletteSign:register()
