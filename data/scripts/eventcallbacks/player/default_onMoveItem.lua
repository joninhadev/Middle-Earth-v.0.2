local ITEM_GOLD_COIN      = 2148
local ITEM_PLATINUM_COIN  = 2152
local ITEM_CRYSTAL_COIN   = 2160

local ITEM_DEPOT_NULL  = 35000
local ITEM_DEPOT_I     = 25453
local ITEM_DEPOT_II    = 25454
local ITEM_DEPOT_III   = 25455
local ITEM_DEPOT_IV    = 25456
local ITEM_DEPOT_V     = 25457
local ITEM_DEPOT_VI    = 25458
local ITEM_DEPOT_VII   = 25459
local ITEM_DEPOT_VIII  = 25460
local ITEM_DEPOT_IX    = 25461
local ITEM_DEPOT_X     = 25462
local ITEM_DEPOT_XI    = 25463
local ITEM_DEPOT_XII   = 25464
local ITEM_DEPOT_XIII  = 25465
local ITEM_DEPOT_XIV   = 25466
local ITEM_DEPOT_XV    = 25467
local ITEM_DEPOT_XVI   = 25468
local ITEM_DEPOT_XVII  = 25469
local ITEM_DEPOT_XVIII = 35018

local blockTeleportTrashing = true

local STONE_SKIN_AMULET       = 2197   -- ID for Stone Skin Amulet
local ENERGY_RING             = 2167   -- ID for Energy Ring
local GOLD_POUCH              = 26377  -- ID for Gold Pouch
local ITEM_SUPPLY_STASH       = 26386
local ITEM_STORE_INBOX        = 26052  -- ID for Store Inbox
local CONTAINER_POSITION      = 65535  -- Macro for container position
local CONST_SLOT_STORE_INBOX  = 11     -- Slot index for the Store Inbox
local CONTAINER_WEIGHT        = 100000 -- 10k = 10000 oz | this function is only for containers, item below the weight determined here can be moved inside the container, for others items look game.cpp at the src

local exercise_ids            = {32384, 32385, 32386, 32387, 32388, 32389}
local dummies                 = {32147, 32148, 32143, 32144, 32145, 32146}
local bathTube                = {29312, 29313}
local NOT_MOVEABLE_ACTION     = 8000
local untradeable_unmoveableItems = {25373, 11773}
local rouletteEnfeits = {33338} -- NÃO PODE MOVER O ITEM QUE TENHA O ID DA TABELA 

-- SSA exhaust
local exhaust = {}

function isInArray(array, value)
    if type(array) ~= "table" then
        return false
    end
    for _, v in pairs(array) do
        if v == value then
            return true
        end
    end
    return false
end

local function safeGetContainerById(player, id)
    if type(id) ~= "number" then
        return nil
    end
    local adjustedId = math.floor(id)
    if adjustedId < 0 or adjustedId >= 256 then
        return nil
    end
    local item = player:getSlotItem(adjustedId)
    if item and item:isContainer() then
        return item
    end
    return nil
end

local function hasNestedContainer(item)
    if item:isContainer() then
        local container = item:getContainer()
        for i = 0, container:getSize() - 1 do
            local nestedItem = container:getItem(i)
            if nestedItem and nestedItem:isContainer() then
                return true
            end
        end
    end
    return false
end

local function antiPush(player, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    local tile = Tile(toPosition)
    if tile and (tile:getItemCount() + count) > 20 then
        player:sendCancelMessage("You can't push more items to this position.")
        return false
    end
    return true
end

local event = Event()
event.onMoveItem = function(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder)
    -- 1) Exercise Weapons
    if isInArray(exercise_ids, item.itemid) then
        self:sendCancelMessage("You cannot move this item outside this container.")
        return false
    end

    -- 2) Dummies
    if isInArray(dummies, item.itemid) then
        if not toPosition:getTile():getHouse() then
            self:sendCancelMessage("You cannot move this item outside the house.")
            return false
        end
    end
	
	
	-- 3) Enfeites / Decorações 
    if isInArray(rouletteEnfeits,item.actionid) then
        self:sendCancelMessage('Você não pode mover esse item.') -- NÃO PODE MOVER O ITEM QUE TENHA O ID DA TABELA LÁ EM CIMA. (rouletteEnfeits)
        return false
    end

    -- 9) SSA exhaust (Stone Skin Amulet)
    if toPosition.x == CONTAINER_POSITION and toPosition.y == CONST_SLOT_NECKLACE and item:getId() == STONE_SKIN_AMULET then
        local pid = self:getId()
        if exhaust[pid] then
            self:sendCancelMessage(RETURNVALUE_YOUAREEXHAUSTED)
            return false
        else
            exhaust[pid] = true
            addEvent(function(pidParam)
                exhaust[pidParam] = false
            end, 2000, pid)
            return true
        end
    end

    -- 10) Prevent moving items from Store Inbox into certain slots
    local containerIdFrom = fromPosition.y - 64
    local containerFrom = self:getContainerById(containerIdFrom)
    if containerFrom then
        if containerFrom:getId() == ITEM_STORE_INBOX and (toPosition.y >= 1 and toPosition.y <= 11 and toPosition.y ~= 3) then
            self:sendCancelMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM)
            return false
        end
        if containerFrom:getId() == ITEM_SUPPLY_STASH and (toPosition.y >= 1 and toPosition.y <= 11 and toPosition.y ~= 3) then
            self:sendCancelMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM)
            return false
        end
    end

    local function getContainerParent(item)
        local parent = item:getParent()
        if parent and parent:isItem() then
            local peekNextParent = parent:getParent()
            if peekNextParent and peekNextParent.itemid == 1 then
                return parent
            end
        end
        return false
    end

    local containerTo = self:getContainerById(toPosition.y - 64)
    if containerTo then
        if containerTo:getId() == ITEM_STORE_INBOX then
            self:sendCancelMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM)
            return false
        end
        if containerTo:getId() == ITEM_SUPPLY_STASH then
            self:sendCancelMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM)
            return false
        end
        -- Gold Pouch
        if containerTo:getId() == GOLD_POUCH then
            -- Only coins can be moved
            if (item:getId() ~= ITEM_CRYSTAL_COIN and
                item:getId() ~= ITEM_PLATINUM_COIN and
                item:getId() ~= ITEM_GOLD_COIN) then
                self:sendCancelMessage("You can only move money to this container.")
                return false
            end

            -- Convert coins into bank balance
            local worth = {
                [ITEM_GOLD_COIN]     = 1,
                [ITEM_PLATINUM_COIN] = 100,
                [ITEM_CRYSTAL_COIN]  = 10000,
            }
            local goldValue = worth[item:getId()]
            if goldValue then
                local newBalance = self:getBankBalance() + (goldValue * item:getCount())
                item:remove()
                self:setBankBalance(newBalance)
                self:sendTextMessage(MESSAGE_STATUS_DEFAULT, string.format("Your new bank balance is %d gps.", newBalance))
                return true
            end
        end

        -- Check if the target container is inside the Store Inbox
        local ignoreArray = {
            2594, 2589, ITEM_DEPOT_NULL, ITEM_DEPOT_I, ITEM_DEPOT_II, ITEM_DEPOT_III,
            ITEM_DEPOT_IV, ITEM_DEPOT_V, ITEM_DEPOT_VI, ITEM_DEPOT_VII, ITEM_DEPOT_VIII,
            ITEM_DEPOT_IX, ITEM_DEPOT_X, ITEM_DEPOT_XI, ITEM_DEPOT_XII, ITEM_DEPOT_XIII,
            ITEM_DEPOT_XIV, ITEM_DEPOT_XV, ITEM_DEPOT_XVI, ITEM_DEPOT_XVII, ITEM_DEPOT_XVIII
        }
        if not isInArray(ignoreArray, containerTo:getId()) and getContainerParent(containerTo) and getContainerParent(containerTo):getId() == ITEM_STORE_INBOX then
            self:sendCancelMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM)
            return false
        end

        local iType = ItemType(containerTo:getId())
        if iType:isCorpse() then
            return false
        end
    end

    -- 11) Do not allow moving the Gold Pouch itself
    if item:getId() == GOLD_POUCH then
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- 12) Do not allow moving items with actionID = 8000
    if item:getActionId() == NOT_MOVEABLE_ACTION then
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- 13) Check two-handed weapons logic
    if toPosition.x ~= CONTAINER_POSITION then
        return true
    end

    if item:getTopParent() == self and bit.band(toPosition.y, 0x40) == 0 then
        local itemType = ItemType(item:getId())
        local moveItem

        -- If the item is two-handed and being placed in the left hand slot
        if bit.band(itemType:getSlotPosition(), SLOTP_TWO_HAND) ~= 0 and toPosition.y == CONST_SLOT_LEFT then
            moveItem = self:getSlotItem(CONST_SLOT_RIGHT)
            if moveItem and itemType:getWeaponType() == WEAPON_DISTANCE and ItemType(moveItem:getId()):getWeaponType() == WEAPON_QUIVER then
                return true
            end
        -- If the item is a shield in the right hand, check left hand for two-handed
        elseif itemType:getWeaponType() == WEAPON_SHIELD and toPosition.y == CONST_SLOT_RIGHT then
            moveItem = self:getSlotItem(CONST_SLOT_LEFT)
            if moveItem and bit.band(ItemType(moveItem:getId()):getSlotPosition(), SLOTP_TWO_HAND) == 0 then
                return true
            end
        end

        if moveItem then
            local parent = item:getParent()
            if parent:getSize() == parent:getCapacity() then
                self:sendTextMessage(MESSAGE_STATUS_SMALL, Game.getReturnMessage(RETURNVALUE_CONTAINERNOTENOUGHROOM))
                return false
            else
                return moveItem:moveTo(parent)
            end
        end
    end

    -- 14) Reward System checks
    if toPosition.x == CONTAINER_POSITION then
        local containerId = toPosition.y - 64
        local container = self:getContainerById(containerId)
        if not container then
            return true
        end

        -- Do not allow inserting items into the Reward Container or Reward Chest
        local itemId = container:getId()
        if itemId == ITEM_REWARD_CONTAINER or itemId == ITEM_REWARD_CHEST then
            self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            return false
        end

        -- Do not allow inserting items into a boss corpse if its corpseowner == 2^31 - 1
        local tileCheck = Tile(container:getPosition())
        for _, corpseItem in ipairs(tileCheck:getItems() or {}) do
            if corpseItem:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == 2^31 - 1 and corpseItem:getName() == container:getName() then
                self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
                return false
            end
        end
    end

    -- 15) Do not allow moving a boss corpse
    if item:getAttribute(ITEM_ATTRIBUTE_CORPSEOWNER) == 2^31 - 1 then
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        return false
    end

    -- 16) Block throwing items on a Reward Chest
    if tile and tile:getItemById(ITEM_REWARD_CHEST) then
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        self:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- 17) Block throwing items on top of teleports
    if blockTeleportTrashing and toPosition.x ~= CONTAINER_POSITION then
        local thing = Tile(toPosition):getItemByType(ITEM_TYPE_TELEPORT)
        if thing then
            self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
            self:getPosition():sendMagicEffect(CONST_ME_POFF)
            return false
        end
    end

    -- 18) Block throwing items on trapdoors
    if tile and tile:getItemById(370) then -- Trapdoor
        self:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
        self:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
    end

    -- 19) Check anti-push limit
    if not antiPush(self, item, count, fromPosition, toPosition, fromCylinder, toCylinder) then
        return false
    end

    return true
end
event:register()
