local config = {
	tibiaCoinid = 24774,
	actionId = 21570,
	podiumIcon = 21570,
	cacheUpdateTime = 10 * 60,
	topBountyLimit = 5,
	minimumBountyValue = 1,
	minimumTargetLevel = 250,

	bountyCache = {
		data = {},
		lastUpdate = 0,
		playerBountyInfo = {},
	},
}

local function getBountyInfo(playerGuid)
	local currentTime = os.time()
	local playerCache = config.bountyCache.playerBountyInfo[playerGuid]

	if playerCache and (currentTime - playerCache.lastUpdate < config.cacheUpdateTime) then
		return playerCache.data
	end

	local query = string.format("SELECT hunted_value, timestamp FROM hunted_players WHERE player_id = %d;", playerGuid)
	local resultId = db.storeQuery(query)

	if resultId then
		local bountyInfo = { value = result.getNumber(resultId, "hunted_value"), date = result.getString(resultId, "timestamp") }
		result.free(resultId)

		config.bountyCache.playerBountyInfo[playerGuid] = { data = bountyInfo, lastUpdate = currentTime }
		return bountyInfo
	end

	return nil
end

local function setBounty(playerGuid, playerName, bountyValue)
	local query = string.format("INSERT INTO hunted_players (player_id, name, hunted_value) VALUES (%d, '%s', %d) ON DUPLICATE KEY UPDATE hunted_value = %d;", playerGuid, playerName, bountyValue, bountyValue)
	db.query(query)

	config.bountyCache.playerBountyInfo[playerGuid] = { data = { value = bountyValue, date = os.date("%Y-%m-%d %H:%M:%S") }, lastUpdate = os.time() }
end

local function removeBounty(playerGuid)
	local query = string.format("DELETE FROM hunted_players WHERE player_id = %d;", playerGuid)
	db.query(query)

	config.bountyCache.playerBountyInfo[playerGuid] = nil
end

local function updateBountyCache()
	local currentTime = os.time()
	if currentTime - config.bountyCache.lastUpdate < config.cacheUpdateTime then
		return
	end

	config.bountyCache.data = {}

	local query = string.format("SELECT name, hunted_value FROM hunted_players ORDER BY hunted_value DESC LIMIT %d;", config.topBountyLimit)
	local resultId = db.storeQuery(query)

	if resultId then
		repeat
			local playerName = result.getString(resultId, "name")
			local bountyValue = result.getNumber(resultId, "hunted_value")
			table.insert(config.bountyCache.data, { name = playerName, value = bountyValue })
		until not result.next(resultId)

		result.free(resultId)
	end

	config.bountyCache.lastUpdate = currentTime
end

local function FormatNumber(number)
	local _, _, minus, int, fraction = tostring(number):find("([-]?)(%d+)([.]?%d*)")
	int = int:reverse():gsub("(%d%d%d)", "%1,")
	return minus .. int:reverse():gsub("^,", "") .. fraction
end

local talk = TalkAction("!hunted")

function talk.onSay(player, words, param)
	local params = param:split(",")
	if #params < 2 then
		player:sendCancelMessage("Command requires 2 parameters: !hunted <player name>, <value>")
		return true
	end

	local playerName = params[1]:trim()
	local huntedValue = tonumber(params[2]:trim())
	if not huntedValue or huntedValue < config.minimumBountyValue then
		player:sendCancelMessage(string.format("The minimum bounty value is %s.", FormatNumber(config.minimumBountyValue)))
		return true
	end

	if player:getName() == playerName then
		player:sendCancelMessage("You cannot put a bounty on yourself.")
		return true
	end

	local targetPlayer = Player(playerName)
	if not targetPlayer then
		player:sendCancelMessage(string.format("%s not found or is offline. No bounty has been placed.", playerName))
		return true
	end

	if targetPlayer:getLevel() < config.minimumTargetLevel then
		player:sendCancelMessage(string.format("%s is below the minimum level of %d to have a bounty placed.", playerName, config.minimumTargetLevel))
		return true
	end

	local bountyInfo = getBountyInfo(targetPlayer:getGuid())
	if bountyInfo then
		if huntedValue > bountyInfo.value then
			local newBountyValue = bountyInfo.value + huntedValue
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("A new, higher bounty of %s has been placed on %s. The previous bounty was %s.", FormatNumber(newBountyValue), playerName, FormatNumber(bountyInfo.value)))
			Game.broadcastMessage(string.format("[HUNTED SYSTEM] The bounty on %s has been increased to %s. The previous bounty was %s.", playerName, FormatNumber(newBountyValue), FormatNumber(bountyInfo.value)))
			huntedValue = newBountyValue
		else
			player:sendCancelMessage(string.format("%s already has a bounty of %s, which is higher or equal to the one you're placing.", playerName, FormatNumber(bountyInfo.value)))
			return true
		end
	end

	if not player:removeItem(config.tibiaCoinid, huntedValue) then
		player:sendCancelMessage(string.format("You do not have enough coins to place a bounty of %s.", FormatNumber(huntedValue)))
		return true
	end

	setBounty(targetPlayer:getGuid(), playerName, huntedValue)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have put a bounty of %s on %s's head.", FormatNumber(huntedValue), playerName))
	Game.broadcastMessage(string.format("[HUNTED SYSTEM] %s has placed a bounty of %s on %s's head!", player:getName(), FormatNumber(huntedValue), playerName), MESSAGE_STATUS_WARNING)
	return true
end

talk:separator(" ")
talk:register()

local loginHuntedHandler = CreatureEvent("LoginHuntedHandler")

function loginHuntedHandler.onLogin(player)
	local bountyInfo = getBountyInfo(player:getGuid())
	if bountyInfo then
		player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format("You have a bounty of %s on your head since %s. The bounty will only be removed when you are killed.", FormatNumber(bountyInfo.value), bountyInfo.date))
	end

	player:registerEvent("HuntedDeathHandler")
	return true
end

loginHuntedHandler:register()

local huntedPodium = Action()

function huntedPodium.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	updateBountyCache()

	local podiumText = "Top bounties (highest bounties placed on players):\n\n"
	if #config.bountyCache.data > 0 then
		for rank, bountyInfo in ipairs(config.bountyCache.data) do
			podiumText = podiumText .. string.format("%d. %s - %s coins.\n", rank, bountyInfo.name, FormatNumber(bountyInfo.value))
		end
	else
		podiumText = "There are currently no bounties."
	end

	player:showTextDialog(config.podiumIcon, podiumText)
	return true
end

huntedPodium:aid(config.actionId)
huntedPodium:register()

local huntedDeathEvent = CreatureEvent("HuntedDeathHandler")

function huntedDeathEvent.onDeath(creature, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
	local huntedPlayer = creature and creature:getPlayer()
	local killerPlayer = killer and killer:getPlayer()
	if not huntedPlayer or not killerPlayer then
		return true
	end

	local huntedIp, killerIp = huntedPlayer:getIp(), killerPlayer:getIp()
	if huntedIp == killerIp or huntedIp == 0 or killerIp == 0 then
		return true
	end

	local huntedGuild = huntedPlayer:getGuild()
	local killerGuild = killerPlayer:getGuild()
	if huntedGuild and killerGuild and huntedGuild:getId() == killerGuild:getId() then
		return true
	end

	local bountyInfo = getBountyInfo(huntedPlayer:getGuid())
	if bountyInfo then
		local bountyValue = bountyInfo.value
		killerPlayer:addItem(config.tibiaCoinid, bountyValue)
		killerPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You have collected a bounty of %s Tibia Coins for killing %s!", FormatNumber(bountyValue), huntedPlayer:getName()))
		Game.broadcastMessage(string.format("[HUNTED SYSTEM] %s has claimed the bounty of %s Tibia Coins for killing %s!", killerPlayer:getName(), FormatNumber(bountyValue), huntedPlayer:getName()), MESSAGE_STATUS_WARNING)
		removeBounty(huntedPlayer:getGuid())
	end
	return true
end

huntedDeathEvent:register()
