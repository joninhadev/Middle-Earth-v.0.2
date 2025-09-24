local event = Event()
event.onDropLoot = function(self, corpse)
    if configManager.getNumber(configKeys.RATE_LOOT) == 0 then
        return
    end

    local mType = self:getType()
    if mType:isRewardBoss() then
        corpse:registerReward()
        return
    end
    
	
    local autolooted = ""

    local function getLootPlayer(players)
        for i, player in ipairs(players) do
            local purse = player:getSlotItem(CONST_SLOT_STORE_INBOX)
            if purse and purse:isContainer() then
                local item26377 = findContainerItem(purse, 26377)
                if item26377 then
                    return player
                end
            end
        end
        return nil
    end	

    local player = Player(corpse:getCorpseOwner())
    local percent = 1.5
    
    local bonusPrey = 0
    local hasCharm = false
    -- Guild Level System
    if player then
        local random = (player:getPreyBonusLoot(mType) >= math.random(100))
        if player:getPreyBonusLoot(mType) > 0 and random then
            bonusPrey = player:getPreyBonusLoot(mType)
            percent = (bonusPrey/100) + percent
        end

        if player:getClient().version >= 1200 then
            percent = percent + 0.05
        end
        local g = player:getGuild()
        if g then
            local rewards = {}
            local number = false
            rewards = getReward(player:getId())
            for i = 1, #rewards do
                if rewards[i].type == GUILD_LEVEL_BONUS_LOOT then
                    number = rewards[i].quantity
                end
            end
            if number then
                percent = percent + number
            end
        end

        -- charm
        local currentCharm = player:getMonsterCharm(mType:raceId())
        if currentCharm == 14 then
            percent = percent * 1.10
            hasCharm = true
        end

    end

    if not player or player:getStamina() > 840 then
        local players = {player}
        local party = player and player:getParty()

        if party then
            local leader = party:getLeader()
            table.insert(players, 1, leader)
        end

        local lootPlayer = getLootPlayer(players)
        if not lootPlayer then
            lootPlayer = player
        end

        local monsterLoot = mType:getLoot()
        for i = 1, #monsterLoot do
            local item = corpse:createLootItem(monsterLoot[i])
            if item > 0 then
                local tmpItem = Item(item)
                if lootPlayer and lootPlayer:getAutoLootItem(tmpItem:getId()) then
                    local purse = lootPlayer:getSlotItem(CONST_SLOT_STORE_INBOX)
                    if purse and purse:isContainer() then
                        local item26377 = findContainerItem(purse, 26377)
                        if item26377 then
                            if tmpItem:getType():isStackable() then
                                local stackedItem = item26377:addItem(tmpItem:getId(), tmpItem:getCount())
                                if stackedItem then
                                    tmpItem:remove()
                                end
                            else
                                if tmpItem:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
                                    local newItem = item26377:addItem(tmpItem:getId())
                                    if newItem then
                                        newItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, tmpItem:getAttribute(ITEM_ATTRIBUTE_CHARGES))
                                        tmpItem:remove()
                                    end
                                else
                                    if item26377:addItem(tmpItem:getId()) then
                                        tmpItem:remove()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        if player then
            local party = player:getParty()
            if party then
                party:broadcastPartyLoot(corpse, mType:getNameDescription(), bonusPrey, hasCharm)
                party:broadcastPartyLootTracker(self, corpse)
            else
                player:sendTextMessage(MESSAGE_LOOT, corpse:getLoot(mType:getNameDescription(), player:getClient().version, bonusPrey, hasCharm))
                player:sendKillTracker(self, corpse)
                player:sendChannelMessage("", corpse:getLoot(mType:getNameDescription(), 900, bonusPrey, hasCharm), TALKTYPE_CHANNEL_O, 10)
            end
        end
    else
        local text = ("Loot of %s: nothing (due to low stamina)"):format(mType:getNameDescription())
        local party = player:getParty()
        if party then
            party:broadcastPartyLoot(text)
        else
            player:sendTextMessage(MESSAGE_LOOT, text)
            player:sendChannelMessage("", text, TALKTYPE_CHANNEL_O, 10)
        end
    end
end

function findContainerItem(container, itemId)
    if container:getId() == itemId then
        return container
    end

    for slot = 0, container:getSize() - 1 do
        local subContainer = container:getItem(slot)
        if subContainer and subContainer:isContainer() then
            local foundContainer = findContainerItem(subContainer, itemId)
            if foundContainer then return foundContainer end
        end
    end

    return nil
end

event:register()