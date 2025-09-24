local ntQuest = Action()

function ntQuest.onUse(player, item, position)

    local leverOne = getGlobalStorageValue(1301) or 0
    local leverTwo = getGlobalStorageValue(1302) or 0
    local leverThree = getGlobalStorageValue(1303) or 0

    if item:getUniqueId() == 1301 then
        if item:getId() == 9827 then
            doTransformItem(item.uid, item.itemid + 1)
            setGlobalStorageValue(1301, 1)
        elseif item:getId() == 9828 then
            doTransformItem(item.uid, item.itemid - 1)
            setGlobalStorageValue(1301, 0)
        end
    elseif item:getUniqueId() == 1302 then
        if item:getId() == 9827 then
            doTransformItem(item.uid, item.itemid + 1)
            setGlobalStorageValue(1302, 1)
        elseif item:getId() == 9828 then
            doTransformItem(item.uid, item.itemid - 1)
            setGlobalStorageValue(1302, 0)
        end
    elseif item:getUniqueId() == 1303 then
        if item:getId() == 9827 then
            doTransformItem(item.uid, item.itemid + 1)
            setGlobalStorageValue(1303, 1)
        elseif item:getId() == 9828 then
            doTransformItem(item.uid, item.itemid - 1)
            setGlobalStorageValue(1303, 0)
        end
    elseif item:getUniqueId() == 1304 then

        if leverOne == 1 and leverTwo == 1 and leverThree == 1 then
			if item:getId() == 5733 then
            	doTransformItem(item.uid, item.itemid + 1)
			elseif item:getId() == 5734 then
				doTransformItem(item.uid, item.itemid - 1)
			end
        else
            player:sendTextMessage(22, "Para abrir o portão, todas as alavancas devem ter sido movidas.")
        end
    end
end

ntQuest:uid(1301, 1302, 1303, 1304)
ntQuest:register()


local ntReward = Action()

local requiredLevel = 200
local storageReward = 5077

function ntReward.onUse(player, item, position)

	if player:getStorageValue(storageReward) < 1 then
		if player:getLevel() >= requiredLevel then
			if item:getUniqueId() == 5040 then
				player:addItem(9776, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR  , "Você encontrou uma divine cuirass.")
				player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
				player:setStorageValue(storageReward, 1)
			elseif item:getUniqueId() == 5041 then
				player:addItem(8891, 1)
				player:sendTextMessage(MESSAGE_INFO_DESCR  , "Você encontrou uma legolas plate.")
				player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
				player:setStorageValue(storageReward, 1)
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_WARNING,"Você precisa ser level 200 ou mais para adquirir sua recompensa.")
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_WARNING,"Esse treasure chest está vazio.")
	end
end

ntReward:uid(5040, 5041)
ntReward:register()
