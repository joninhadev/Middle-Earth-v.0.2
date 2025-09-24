local events = {
	'blockAll',
	'blockGreatAll',
	'PlayerDeath',
	'AdvanceSave',
	'DropLoot',
	'BossParticipation',
	'TaskKill',
	'fireLibrary',
	'earthLibrary',
	'iceLibrary',
	'energyLibrary',
	'AutoLoot',
}


local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
		if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)

--[[
TIPOS DE MARCA PRO MINIMAP


	MAPMARK_QUESTION = 1,   -- bom para quests
	MAPMARK_EXCLAMATION = 2,
	MAPMARK_STAR = 3,
	MAPMARK_CROSS = 4,
	MAPMARK_TEMPLE = 5,
	MAPMARK_KISS = 6,
	MAPMARK_SHOVEL = 7,
	MAPMARK_SWORD = 8,
	MAPMARK_FLAG = 9,
	MAPMARK_LOCK = 10,
	MAPMARK_BAG = 11,
	MAPMARK_SKULL = 12,
	MAPMARK_DOLLAR = 13,
	MAPMARK_REDNORTH = 14,
	MAPMARK_REDSOUTH = 15,
	MAPMARK_REDEAST = 16,
	MAPMARK_REDWEST = 17,
	MAPMARK_GREENNORTH = 18,
	MAPMARK_GREENSOUTH = 19,


]]





--	marks = {
  --          [0] = {pos = {x = 1062, y = 652, z = 7}, type = MAPMARK_TEMPLE, description = "Moria"},
 --           [1] = {pos = {x = 696, y = 116, z = 7}, type = MAPMARK_EXCLAMATION, description = "[NPC] Prosak | Tools Seller"},
    --        [2] = {pos = {x = 725, y = 93, z = 7}, type = MAPMARK_EXCLAMATION, description = "[NPC] Prosak | Weapons"},
 --           [3] = {pos = {x = 1003, y = 80, z = 7}, type = MAPMARK_SWORD, description = "[SPAWN] Barbarian Camp"},
   --         [4] = {pos = {x = 1244, y = 1371, z = 7}, type = MAPMARK_SWORD, description = "[SPAWN] Knights Village"},
   --         [5] = {pos = {x = 707, y = 99, z = 7}, type = MAPMARK_TEMPLE, description = "Forodwaith"},
  --          [6] = {pos = {x = 707, y = 99, z = 7}, type = MAPMARK_TEMPLE, description = "Forodwaith"},
    --        [7] = {pos = {x = 707, y = 99, z = 7}, type = MAPMARK_TEMPLE, description = "Forodwaith"},
  --        [8] = {pos = {x = 707, y = 99, z = 7}, type = MAPMARK_TEMPLE, description = "Forodwaith"},
    --        [9] = {pos = {x = 707, y = 99, z = 7}, type = MAPMARK_TEMPLE, description = "Forodwaith"},
 --           [10] = {pos = {x = 707, y = 99, z = 7}, type = MAPMARK_TEMPLE, description = "Forodwaith"},
			
--            [11] = {pos = {x = 707, y = 99, z = 7}, type = MAPMARK_TEMPLE, description = "Forodwaith"} -- o ultimo sempre sem virgula
           
           
 --           }

 --       for i = 0, #marks do
            -- nao de$comentar, fun??o ainda nao exi$te   |    player:removeMapMark(marks[i].pos, marks[i].type, marks[i].description)
 --           player:addMapMark(marks[i].pos, marks[i].type, marks[i].description)
--       end
		
	local g = player:getGuild()
	if g then
		if player:getLevel() >= CONFIG_GUILD_LEVEL.minLevelToGetPoints then
			player:registerEvent('guildLevel')
		end
		player:registerEvent('guildLevel_e')
	end	

	local loginStr = 'Bem vindo ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
	
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. ' Por favor, escolha seu outfit.'

		player:setBankBalance(0)
		
	local vocation = player:getVocation():getId() -- pega o ID da vocação

	if vocation ~= 17 and vocation ~= 21 and vocation ~= 35 then
		if player:getSex() == 1 then
			player:setOutfit({lookType = 128, lookHead = 78, lookBody = 106, lookLegs = 58, lookFeet = 76})
		else
			player:setOutfit({lookType = 136, lookHead = 78, lookBody = 106, lookLegs = 58, lookFeet = 76})
		end
	end

	-- SPAWN inicial por vocação
	if vocation == 9 then
		player:teleportTo(Position(737, 518, 3)) -- coords da Town 1
	elseif vocation == 35 then
		player:teleportTo(Position(1047, 537, 2)) -- coords da Town 2
	elseif vocation == 21 then
		player:teleportTo(Position(1506, 1235, 6)) -- coords da Town 2
	elseif vocation == 17 then
		player:teleportTo(Position(1062, 652, 7)) -- coords da Town 3
	end

	
	else
		if player:getStorageValue(30001) < 1 then
			player:setStorageValue(30001, 1)
		else
		end
		loginStr = string.format('Sua ultima visita foi em %s.', os.sdate('%a %b %d %X %Y', player:getLastLoginSaved()))
	end
    
	AutoLootList:onLogin(player:getId())
	
	local categoryOrder = { "normal", "second", "third", "boss" }
	local categoryNames = { normal = "1", second = "2", third = "3", boss = "Boss" }
	local boostMessages = {}

	-- Construir mensagens por categoria
	for _, boosted in ipairs(boostCreature) do
		local cat = boosted.category
		local list = boostMessages[cat] or {}
		list[#list + 1] = string.format("%s: %s +%d%% experiência, +%d%% loot", categoryNames[cat], boosted.name, boosted.exp, boosted.loot)
		boostMessages[cat] = list
	end

	-- Organizar mensagens na ordem definida
	local orderedMessages = {}
	for _, category in ipairs(categoryOrder) do
		local msgs = boostMessages[category]
		if msgs then
			for i = 1, #msgs do
				orderedMessages[#orderedMessages + 1] = msgs[i]
			end
		end
	end

	-- Enviar ao jogador
	if #orderedMessages > 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
			"As seguintes criaturas estão boostadas:\n" ..
			table.concat(orderedMessages, "\n") ..
			"\n\nMonstros boostados concedem mais loot, experiência e nascem mais rápido."
		)
	end





	-- exercise Weapon
	player:setStorageValue(37 , -1)
	player:setStorageValue(38 , -1)

	local playerId = player:getId()


	if (player:getAccountType() == ACCOUNT_TYPE_GOD) then
	end

	-- Stamina
	nextUseStaminaTime[playerId] = 1

	-- EXP Stamina
	nextUseXpStamina[playerId] = 1


	if (player:getAccountType() == ACCOUNT_TYPE_TUTOR) then
		local msg = [[:: Tutor Rules
	????????????1 *> 3 Warnings you lose the job.
	????????????2 *> Without parallel conversations with players in Help, if the player starts offending, you simply mute it.
	????????????3 *> Be educated with the players in Help and especially in the Private, try to help as much as possible.
	????????????4 *> Always be on time, if you do not have a justification you will be removed from the staff.
	????????????5 *> Help is only allowed to ask questions related to tibia.
	????????????6 *> It is not allowed to divulge time up or to help in quest.
	????????????7 *> You are not allowed to sell items in the Help.
	????????????8 *> If the player encounters a bug, ask to go to the website to send a ticket and explain in detail.
	????????????9 *> Always keep the Tutors Chat open. (required).
	????????????10 *> You have finished your schedule, you have no tutor online, you communicate with some CM in-game or ts and stay in the help until someone logs in, if you can.
	????????????11 *> Always keep a good Portuguese in the Help, we want tutors who support, not that they speak a satanic ritual.
	????????????12 *> If you see a tutor doing something that violates the rules, take a print and send it to your superiors. "
	????????????- Commands -
	????????????Mute Player: / mute nick, 90. (90 seconds)
	????????????Unmute Player: / unmute nick.
	????????????- Commands -]]
		player:popupFYI(msg)
	end

	if player:getGroup():getId() > 5 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Horario atual no servidor: ".. os.date("%d.%m.%Y - %X") .." \nHorario com dump: "..os.sdate("%d.%m.%Y - %X", os.stime()))
	end
	-- chave-ssh: chavepri1234

	-- OPEN CHANNELS
	if table.contains({"Rookgaard", "Dawnport"}, player:getTown():getName())then
		--player:openChannel(7) -- help channel
		player:openChannel(3) -- world chat
		player:openChannel(6) -- advertsing rook main
	else
		--player:openChannel(7) -- help channel
		player:openChannel(3) -- world chat
		player:openChannel(5) -- advertsing main
	end

	--
	-- Rewards
	local rewards = #player:getRewardList()
	if(rewards > 0) then
		player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Você tem %d %s no seu baú de recompensas.", rewards, rewards > 1 and "recompensas" or "recompensa"))
	end

	-- Update player id
	local stats = player:inBossFight()
	if stats then
		stats.playerId = player:getId()
	end

	-- Events
	for i = 1, #events do
		player:registerEvent(events[i])
		player:registerEvent("AutoLoot")
	end
	


	if player:getStorageValue(45162) == -1 then
		player:setStorageValue(5152, 0)
		player:setStorageValue(45162, 1)
	end

	if player:getStorageValue(Storage.combatProtectionStorage) < 1 then
		player:setStorageValue(Storage.combatProtectionStorage, 1)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end


	local proxy = player:getProxyInfo()
	if proxy then
		player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("You are logged in using the %s server.", proxy.name))
	end

	if configManager.getDouble(configKeys.SPAWN_SPEED) > 1.0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("All spawns are faster."))
	end
	
	if player:getStorageValue(Storage.isTraining) == 1 then -- redefinir storage de exercise weapon
		player:setStorageValue(Storage.isTraining,0)
	end

	player:updateExpState()
	player:setStorageValue(Storage.combatProtectionStorage, -1)
		
	return true
end
