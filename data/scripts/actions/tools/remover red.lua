local removeRedskull = Action()

local config = {
    itemToUse = 57411, 
    requiredItem = 57411, 
    premiumDaysCost = 0
}

function removeRedskull.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("Você precisa estar em uma zona de proteção.")
        return true
    end

    if not isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
        player:sendCancelMessage("Você não está red skull.")
        return true
    end

    if not player:removeItem(config.requiredItem, 1) then
        player:sendCancelMessage("Você precisa ter o item especial para usar isso.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    player:removePremiumDays(config.premiumDaysCost)
    player:setSkull(SKULL_NONE)
    player:setSkullTime(0)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)

    local guid = player:getGuid()
    local playerName = player:getName()

    player:remove()

    db.query("UPDATE `player_deaths` SET `unjustified` = 0 WHERE `unjustified` = 1 AND `killed_by` = " .. db.escapeString(playerName))
    db.asyncQuery("DELETE FROM `player_kills` WHERE `player_id` = " .. guid)

    return true
end

removeRedskull:id(57411)
removeRedskull:register()
