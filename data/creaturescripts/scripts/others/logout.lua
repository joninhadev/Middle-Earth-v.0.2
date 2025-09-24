function onLogout(player)
	-- if player:getStorageValue(Storage.LoginLogoutExaust) > os.stime() then
		-- player:sendCancelMessage("You are performing a very fast action.")
		-- return false
	-- end

	if player:getStorageValue(Storage.isTraining) > 0 then
	   player:sendTextMessage(19, "Para deslogar é necessário parar o uso do exercise dummy.")
		return false
	end
	
	if player:getStorageValue(48550) > 0 then
		player:sendTextMessage(19, "Você não pode deslogar enquanto a roleta estiver ativa.")
		return false
	end

	player:setStorageValue(Storage.LoginLogoutExaust, os.stime() + 5)
    local playerId = player:getId()
    if nextUseStaminaTime[playerId] ~= nil then
        nextUseStaminaTime[playerId] = nil
    end
	
	AutoLootList:onLogout(player:getId(), player:getGuid())

	player:setStorageValue(Storage.Exercisedummy.exaust, 0)

 	local stats = player:inBossFight()
	if stats then
		local boss = Monster(stats.bossId)
		-- Player logged out (or died) in the middle of a boss fight, store his damageOut and stamina
		if boss then
			local dmgOut = boss:getDamageMap()[playerId]
			if dmgOut then
				stats.damageOut = (stats.damageOut or 0) + dmgOut.total
			end
			stats.stamina = player:getStamina()
		end
	end

	player:logoutEvent()
	player:setStorageValue(17101,0)

	return true
end
