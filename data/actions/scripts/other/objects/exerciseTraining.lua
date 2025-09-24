local function getMagicLevelStage(a)
    local b = 1
    if a >= 0 and a <= 20 then
        b = 20
        elseif a >= 21 and a <= 40 then
        b = 17 
        elseif a >= 41 and a <= 60 then
        b = 12
        elseif a >= 61 and a <= 80 then
        b = 10
        elseif a >= 81 and a <= 90 then
        b = 7
        elseif a >= 91 and a <= 99 then
        b = 6
        elseif a >= 100 and a <= 115 then
        b = 4
		elseif a >= 116 and a <= 125 then
        b = 3
		elseif a >= 126 then
		b = 2
    end
    --print('Debug do ml', b)
    return b
end

local function getSkillStage(a)
    local b = 1
    if a >= 0 and a <= 20 then
    b = 25
    elseif a >= 21 and a <= 40 then
    b = 20
    elseif a >= 41 and a <= 60 then
    b = 18
    elseif a >= 61 and a <= 80 then
    b = 16
    elseif a >= 81 and a <= 90 then
    b = 12
	elseif a >= 91 and a <= 99 then
    b = 11
    elseif a >= 100 and a <= 110 then
    b = 10
	elseif a >= 111 and a <= 120 then
    b = 9
    elseif a >= 121 then
    b = 8
    end
    --print('debug do skill', b)

    return b
end

local skills = {
	[33082] = {id = SKILL_SWORD, voc = {4}}, -- KNIGHT
	[33083] = {id = SKILL_AXE, voc = {4}}, -- KNIGHT
	[33084] = {id = SKILL_CLUB, voc = {4}}, -- KNIGHT
	[33085] = {id = SKILL_DISTANCE, voc = {3}, range = CONST_ANI_SIMPLEARROW}, -- PALADIN
	[33086] = {id = SKILL_MAGLEVEL, voc = {1, 2, 3, 4}, range = CONST_ANI_SMALLICE}, -- DRUID
	[33087] = {id = SKILL_MAGLEVEL, voc = {1, 2, 3, 4}, range = CONST_ANI_FIRE}, -- SORCERER

	-- free
	[32124] = {id = SKILL_SWORD, voc = {4}}, -- KNIGHT
	[32125] = {id = SKILL_AXE, voc = {4}}, -- KNIGHT
	[32126] = {id = SKILL_CLUB, voc = {4}}, -- KNIGHT
	[32127] = {id = SKILL_DISTANCE, voc = {3}, range = CONST_ANI_SIMPLEARROW}, -- PALADIN
	[32128] = {id = SKILL_MAGLEVEL, voc = {1, 2, 3, 4}, range = CONST_ANI_SMALLICE}, -- DRUID
	[32129] = {id = SKILL_MAGLEVEL, voc = {1, 2, 3, 4}, range = CONST_ANI_FIRE} -- SORCERER		
}

local houseDummies = {32143, 32144, 32145, 32146, 32147, 32148, 57462, 57463, 57489, 57490}
local freeDummies = {32142, 32149}

local function start_train(pid,start_pos,itemid,fpos, bonusDummy, dummyId)
    local player = Player(pid)
    if player ~= nil then

    local skillRate = 1
    local magicRate = 1

    if skills[itemid].id == SKILL_MAGLEVEL then
        magicRate = getMagicLevelStage(player:getMagicLevel(SKILL_MAGLEVEL))
    else
        skillRate = getSkillStage(player:getSkillLevel(skills[itemid].id))
    end

    --testa mais uma vez


    if Tile(fpos):getItemById(dummyId) then
        local pos_n = player:getPosition()
        if start_pos:getDistance(pos_n) == 0 and getTilePzInfo(pos_n) then
            if player:getItemCount(itemid) >= 1 then
                local exercise = player:getItemById(itemid,true)
                if exercise:isItem() then
                    if exercise:hasAttribute(ITEM_ATTRIBUTE_CHARGES) then
                        local charges_n = exercise:getAttribute(ITEM_ATTRIBUTE_CHARGES)
                        if charges_n > 1 then
                            exercise:setAttribute(ITEM_ATTRIBUTE_CHARGES,(charges_n-1))

                            local voc = player:getVocation()

                            if skills[itemid].id == SKILL_MAGLEVEL then
                                if not bonusDummy then
                                    player:addManaSpent(math.ceil(650*magicRate))
                                else
                                    player:addManaSpent(math.ceil(650*magicRate)*1.1) -- 10%
                                end
                            else
                                if not bonusDummy then
                                    player:addSkillTries(skills[itemid].id, 2*skillRate)
                                else
                                    player:addSkillTries(skills[itemid].id, (2*skillRate)*1.1) -- 10%
                                end
                            end
                                fpos:sendMagicEffect(CONST_ME_GROUNDSHAKER)
                            if skills[itemid].range then
                                pos_n:sendDistanceEffect(fpos, skills[itemid].range)
                            end
                            local training = addEvent(start_train, voc:getAttackSpeed(), pid,start_pos,itemid,fpos,bonusDummy,dummyId)
                            player:setStorageValue(Storage.isTraining,1)
                        else
                            exercise:remove(1)
                            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training weapon vanished.")
                            stopEvent(training)
                            player:setStorageValue(Storage.isTraining,0)
                        end
                    end
                end
            end
        else
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training has stopped.")
            stopEvent(training)
            player:setStorageValue(Storage.isTraining,0)
        end
    else
    stopEvent(training)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training has stopped.")
            player:setStorageValue(Storage.isTraining, 0)
            end
            else
        stopEvent(training)
        if player then
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Your training has stopped.")
            player:setStorageValue(Storage.isTraining,0)
        end
    end
  
    return true
end

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
        
    local start_pos = player:getPosition()
    if player:getStorageValue(Storage.isTraining) == 1 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "You are already training.")
        return false
    end
    if target:isItem() then
        if isInArray(houseDummies,target:getId()) then
            if not skills[item.itemid].range and (start_pos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You started training.")
            start_train(player:getId(),start_pos,item.itemid,target:getPosition(), true, target:getId())
        
        elseif isInArray(freeDummies, target:getId()) then
            if not skills[item.itemid].range and (start_pos:getDistance(target:getPosition()) > 1) then
                player:sendTextMessage(MESSAGE_INFO_DESCR, "Get closer to the dummy.")
                stopEvent(training)
                return true
            end
            player:sendTextMessage(MESSAGE_INFO_DESCR, "You started training.")
            start_train(player:getId(),start_pos,item.itemid,target:getPosition(), false, target:getId())
        end
    end
    return true
end