local firstReward = TalkAction("!reward")

local sReward = 77658
local weaponAxe = 33083
local weaponClub = 33084
local weaponSword = 33082
local weaponBow = 33085
local weaponWand = 33087
local weaponRod = 33086
local weaponCharges = 500
local rewardActionId = 33338
local lvl = 10

function firstReward.onSay(player, words, param, item)
    local vocation = player:getVocation():getId()

    if player:getLevel() < lvl then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa ser level: " .. lvl .. " ou mais para adquirir sua recompensa.")
        return true
    end

    if player:getStorageValue(sReward) >= 1 then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você já recebeu sua recompensa!")
        return true
    end

    local rewardItemId

    if vocation >= 1 and vocation <= 4 then -- MS
        rewardItemId = weaponWand

    elseif vocation >= 5 and vocation <= 8 then -- ED
        rewardItemId = weaponRod

    elseif (vocation >= 9 and vocation <= 12) or (vocation >= 35 and vocation <= 39) then -- RP e vocações especiais
        rewardItemId = weaponBow

    elseif vocation >= 13 and vocation <= 26 then -- EK e outras
        -- Verifica a maior habilidade corpo a corpo
        local swordSkill = player:getSkillLevel(SKILL_SWORD)
        local axeSkill = player:getSkillLevel(SKILL_AXE)
        local clubSkill = player:getSkillLevel(SKILL_CLUB)

        if swordSkill >= axeSkill and swordSkill >= clubSkill then
            rewardItemId = weaponSword
        elseif axeSkill > swordSkill and axeSkill >= clubSkill then
            rewardItemId = weaponAxe
        else
            rewardItemId = weaponClub
        end
    end

    if rewardItemId then
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_BLUE)
        local rewardItem = Game.createItem(rewardItemId, weaponCharges)
        if rewardItem then
            rewardItem:setActionId(rewardActionId)
            local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
            if inbox then
                inbox:addItemEx(rewardItem)
            end
        end
    end

    player:setStorageValue(sReward, 1)
end

firstReward:separator("")
firstReward:register()
