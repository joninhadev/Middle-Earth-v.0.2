local RefineSystem = {}

-- Item type constants
ITEM_TYPE_ARMOR = ITEM_TYPE_ARMOR or 2
ITEM_TYPE_HELMET = ITEM_TYPE_HELMET or 4
ITEM_TYPE_LEGS = ITEM_TYPE_LEGS or 7
ITEM_TYPE_BOOTS = ITEM_TYPE_BOOTS or 8
ITEM_TYPE_AMULET = ITEM_TYPE_AMULET or 9
ITEM_TYPE_HAND = ITEM_TYPE_HAND or 10
ITEM_TYPE_SHIELD = ITEM_TYPE_SHIELD or 11

RefineSystem.lastMessageTime = {}

RefineSystem.config = {
    Hammer = 2557,
    effectSuccess = 305,
    effectFail = 306,
    effectPoff = CONST_ME_POFF,
    effectHammer = 313,
    refineDelay = 3000,
    positionHammerEffect = {x = 1106, y = 751, z = 7},
    positionSuccessEffect = {x = 1106, y = 751, z = 7},
    brilhante = 305,
    messageCooldown = 2,

    blockedIds = {
        
    },

    allowedVocations = {17, 18, 19, 20},

    messages = {
        notAllowed = "Você não tem permissão para refinar.",
        cantRefine = "Você não pode refinar este item.",
        failed = "Você falhou, seu item regrediu um nível e você perdeu os materiais.",
        success = "Você obteve sucesso! Seu item agora é +%d.",
        maxLevel = "O seu item está no nivel máximo.",
        missingMaterials = "Você precisa colocar os seguintes materiais na mesa para refinar:",
        invalidPosition = "Os materiais ou o item não estão nas posições corretas.",
        noItemToRefine = "Não há item para refinar nesta tabela.",
        invalidItem = "O item colocado na mesa não é válido para refinamento.",
        needLevel = "Você precisa ser nivel %d para refinar este item para +%d.",
        materialInfo = "%d %s"
    }
}

RefineSystem.ANVIL_ID = 2555
RefineSystem.TABLE_ID = 1485
RefineSystem.REFINE_POSITIONS = {
    {x = 997, y = 625, z = 6}, -- [M1] 997, 625, 6
    {x = 998, y = 625, z = 6}, -- [M2] 998, 625, 6
    {x = 999, y = 625, z = 6}, -- [M3] 999, 625, 6
    {x = 996, y = 625, z = 6}  -- [IP] 996, 625, 6
}

RefineSystem.refinementMaterials = {
    [1] = {level=50, chance=80, bonusPercent=1, materials={
        {itemId=25376,name="Iron token",count=1},
        {itemId=25379,name="Platinum token",count=1},
        {isIdenticalItem=true,name="Item idêntico.",count=1}}},
    [2] = {level=100, chance=65, bonusPercent=2, materials={
        {itemId=25376,name="Iron token",count=1},
        {itemId=25379,name="Platinum token",count=1},
        {isIdenticalItem=true,name="Item idêntico.",count=1}}},
    [3] = {level=150, chance=60, bonusPercent=3, materials={
        {itemId=25376,name="Iron token",count=1},
        {itemId=25379,name="Platinum token",count=1},
        {isIdenticalItem=true,name="Item idêntico.",count=1}}},
    [4] = {level=200, chance=55, bonusPercent=4, materials={
        {itemId=25376,name="Iron token",count=1},
        {itemId=25379,name="Platinum token",count=1},
        {isIdenticalItem=true,name="Item idêntico.",count=1}}},
    [5] = {level=300, chance=50, bonusPercent=5, materials={
        {itemId=25376,name="Iron token",count=1},
        {itemId=25379,name="Platinum token",count=1},
        {isIdenticalItem=true,name="Item idêntico.",count=1}}}
}

RefineSystem.absorbAttributes = {
    ice = ITEM_ATTRIBUTE_ABSORBICE,
    earth = ITEM_ATTRIBUTE_ABSORBEARTH,
    fire = ITEM_ATTRIBUTE_ABSORBFIRE,
    energy = ITEM_ATTRIBUTE_ABSORBENERGY,
    death = ITEM_ATTRIBUTE_ABSORBDEATH,
    holy = ITEM_ATTRIBUTE_ABSORBHOLY,
    physical = ITEM_ATTRIBUTE_ABSORB_PHYSICAL
}

RefineSystem.combatTypes = {
    ice = COMBAT_ICEDAMAGE,
    earth = COMBAT_EARTHDAMAGE,
    fire = COMBAT_FIREDAMAGE,
    energy = COMBAT_ENERGYDAMAGE,
    death = COMBAT_DEATHDAMAGE,
    holy = COMBAT_HOLYDAMAGE,
    physical = COMBAT_PHYSICALDAMAGE
}

local function resetDynamic(item, attr)
    if item:getAttribute(attr) then
        item:removeAttribute(attr)
    end
end

local function getBaseAbsorb(item, combatType)
    local it = item:getType()
    
    local totalAbsorb = item:getAbsorbPercent(combatType)
    
    local dynamicAbsorb = 0
    if combatType == COMBAT_ICEDAMAGE and item:hasAttribute(ITEM_ATTRIBUTE_ABSORBICE) then
        dynamicAbsorb = item:getAttribute(ITEM_ATTRIBUTE_ABSORBICE)
    elseif combatType == COMBAT_EARTHDAMAGE and item:hasAttribute(ITEM_ATTRIBUTE_ABSORBEARTH) then
        dynamicAbsorb = item:getAttribute(ITEM_ATTRIBUTE_ABSORBEARTH)
    elseif combatType == COMBAT_FIREDAMAGE and item:hasAttribute(ITEM_ATTRIBUTE_ABSORBFIRE) then
        dynamicAbsorb = item:getAttribute(ITEM_ATTRIBUTE_ABSORBFIRE)
    elseif combatType == COMBAT_ENERGYDAMAGE and item:hasAttribute(ITEM_ATTRIBUTE_ABSORBENERGY) then
        dynamicAbsorb = item:getAttribute(ITEM_ATTRIBUTE_ABSORBENERGY)
    elseif combatType == COMBAT_DEATHDAMAGE and item:hasAttribute(ITEM_ATTRIBUTE_ABSORBDEATH) then
        dynamicAbsorb = item:getAttribute(ITEM_ATTRIBUTE_ABSORBDEATH)
    elseif combatType == COMBAT_HOLYDAMAGE and item:hasAttribute(ITEM_ATTRIBUTE_ABSORBHOLY) then
        dynamicAbsorb = item:getAttribute(ITEM_ATTRIBUTE_ABSORBHOLY)
    elseif combatType == COMBAT_PHYSICALDAMAGE and item:hasAttribute(ITEM_ATTRIBUTE_ABSORB_PHYSICAL) then
        dynamicAbsorb = item:getAttribute(ITEM_ATTRIBUTE_ABSORB_PHYSICAL)
    end
    
    local staticAbsorb = totalAbsorb - dynamicAbsorb
    
    return staticAbsorb
end

function RefineSystem.applyBonuses(item, lvl)
    if not item then
        return
    end
    
    local it = item:getType()
    local itemType = it:getType()
    local weaponType = it:getWeaponType()
    local isShield = weaponType == WEAPON_SHIELD or itemType == ITEM_TYPE_SHIELD

    if weaponType > 0 and not isShield then
        item:setAttribute(ITEM_ATTRIBUTE_ATTACK, it:getAttack() + lvl)
    elseif isShield then
        item:setAttribute(ITEM_ATTRIBUTE_DEFENSE, it:getDefense() + lvl)
        
        for elem, attr in pairs(RefineSystem.absorbAttributes) do
            local baseProt = getBaseAbsorb(item, RefineSystem.combatTypes[elem])
            if baseProt > 0 then
                local currentProt = item:getAttribute(attr)
                if currentProt == nil then currentProt = baseProt end
                resetDynamic(item, attr)
                local newValue = currentProt + 1
                item:setAttribute(attr, newValue)
            end
        end
    elseif itemType == ITEM_TYPE_ARMOR or 
           itemType == ITEM_TYPE_HELMET or 
           itemType == ITEM_TYPE_LEGS or 
           itemType == ITEM_TYPE_BOOTS or 
           itemType == ITEM_TYPE_AMULET or 
           itemType == ITEM_TYPE_HAND then
        
        item:setAttribute(ITEM_ATTRIBUTE_ARMOR, it:getArmor() + lvl)
        
        for elem, attr in pairs(RefineSystem.absorbAttributes) do
            local baseProt = getBaseAbsorb(item, RefineSystem.combatTypes[elem])
            if baseProt > 0 then
                local currentProt = item:getAttribute(attr)
                if currentProt == nil then currentProt = baseProt end
                resetDynamic(item, attr)
                item:setAttribute(attr, currentProt + 1)
            end
        end
    end
end

function RefineSystem.removeBonuses(item, lvl)
    if not item then
        return
    end
    
    if lvl <= 0 then return end
    local it = item:getType()
    local itemType = it:getType()
    local isShield = it:getWeaponType() == WEAPON_SHIELD or itemType == ITEM_TYPE_SHIELD

    if it:getWeaponType() > 0 and not isShield then
        item:setAttribute(ITEM_ATTRIBUTE_ATTACK, it:getAttack() + (lvl-1))
    elseif isShield then
        item:setAttribute(ITEM_ATTRIBUTE_DEFENSE, it:getDefense() + (lvl-1))
        
        for elem, attr in pairs(RefineSystem.absorbAttributes) do
            local baseProt = getBaseAbsorb(item, RefineSystem.combatTypes[elem])
            if baseProt > 0 then
                local currentProt = item:getAttribute(attr)
                if currentProt == nil then currentProt = baseProt end
                resetDynamic(item, attr)
                item:setAttribute(attr, currentProt - 1)
            end
        end
    elseif itemType == ITEM_TYPE_ARMOR or 
           itemType == ITEM_TYPE_HELMET or 
           itemType == ITEM_TYPE_LEGS or 
           itemType == ITEM_TYPE_BOOTS or 
           itemType == ITEM_TYPE_AMULET or 
           itemType == ITEM_TYPE_HAND then
        
        item:setAttribute(ITEM_ATTRIBUTE_ARMOR, it:getArmor() + (lvl-1))
        
        for elem, attr in pairs(RefineSystem.absorbAttributes) do
            local baseProt = getBaseAbsorb(item, RefineSystem.combatTypes[elem])
            if baseProt > 0 then
                local currentProt = item:getAttribute(attr)
                if currentProt == nil then currentProt = baseProt end
                resetDynamic(item, attr)
                item:setAttribute(attr, currentProt - 1)
            end
        end
    end
end

function RefineSystem.cleanOldMessages()
    local now = os.time()
    for k, t in pairs(RefineSystem.lastMessageTime) do
        if now - t > 60 then
            RefineSystem.lastMessageTime[k] = nil
        end
    end
end

function RefineSystem.sendUniqueMessage(player, msg, cd)
    cd = cd or RefineSystem.config.messageCooldown
    local key = player:getGuid() .. msg
    local now = os.time()

    if RefineSystem.lastMessageTime[key] and now - RefineSystem.lastMessageTime[key] < cd then
        return false
    end

    RefineSystem.lastMessageTime[key] = now
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, msg)
    return true
end

function RefineSystem.getRefinementLevel(item)
    local n = tostring(item:getName()):match("%+(%d+)$")
    return tonumber(n) or 0
end

function RefineSystem.checkMaterials(pos, need, target)
    local missing = {}

    for i, mat in ipairs(need) do
        local tile = Tile(pos[i])
        if not tile then
            table.insert(missing, mat)
        else
            local itm = tile:getTopDownItem()
            if mat.isIdenticalItem then
                if not itm or itm:getId() ~= target:getId() or itm:getCount() < mat.count then
                    table.insert(missing, mat)
                end
            else
                if not itm or itm:getId() ~= mat.itemId or itm:getCount() < mat.count then
                    table.insert(missing, mat)
                end
            end
        end
    end
    return missing
end

function RefineSystem.refineItem(player, pos)
    RefineSystem.cleanOldMessages()

    if not table.contains(RefineSystem.config.allowedVocations, player:getVocation():getId()) then
        return RefineSystem.sendUniqueMessage(player, RefineSystem.config.messages.notAllowed)
    end

    local targetTile = Tile(pos[4])
    if not targetTile then
        return RefineSystem.sendUniqueMessage(player, RefineSystem.config.messages.invalidPosition)
    end

    local hasTable = false
    for _, i in pairs(targetTile:getItems() or {}) do
        if i:getId() == RefineSystem.TABLE_ID then 
            hasTable = true 
            break 
        end
    end
    if not hasTable then
        return RefineSystem.sendUniqueMessage(player, "You need to use a valid refinement table.")
    end

    local targetItem
    for _, i in pairs(targetTile:getItems() or {}) do
        if i:getId() ~= RefineSystem.TABLE_ID then
            targetItem = i
            break
        end
    end
    if not targetItem then
        return RefineSystem.sendUniqueMessage(player, RefineSystem.config.messages.noItemToRefine)
    end

    if table.contains(RefineSystem.config.blockedIds, targetItem:getId()) then
        targetTile:getPosition():sendMagicEffect(RefineSystem.config.effectPoff)
        return RefineSystem.sendUniqueMessage(player, RefineSystem.config.messages.cantRefine)
    end

    local curLvl = RefineSystem.getRefinementLevel(targetItem)
    local nextLvl = curLvl + 1
    local data = RefineSystem.refinementMaterials[nextLvl]

    if not data then
        return RefineSystem.sendUniqueMessage(player, RefineSystem.config.messages.maxLevel)
    end
    if player:getLevel() < data.level then
        return RefineSystem.sendUniqueMessage(player,
            string.format(RefineSystem.config.messages.needLevel, data.level, nextLvl))
    end

    local missing = RefineSystem.checkMaterials(pos, data.materials, targetItem)
    if #missing > 0 then
        RefineSystem.sendUniqueMessage(player, RefineSystem.config.messages.missingMaterials)
        for _, m in ipairs(missing) do
            RefineSystem.sendUniqueMessage(player,
                string.format(RefineSystem.config.messages.materialInfo, m.count, m.name))
        end
        targetTile:getPosition():sendMagicEffect(RefineSystem.config.effectFail)
        return false
    end

    for i, mat in ipairs(data.materials) do
        local tile = Tile(pos[i])
        if tile then
            local itm = tile:getTopDownItem()
            if itm then
                itm:remove(mat.count)
                tile:getPosition():sendMagicEffect(6)
            end
        end
    end

    local effCnt, effMax = 0, 3
    local function hammerFx()
        effCnt = effCnt + 1
        targetTile:getPosition():sendMagicEffect(RefineSystem.config.effectHammer)
        if effCnt < effMax then 
            addEvent(hammerFx, 1000) 
        end
    end
    hammerFx()

    addEvent(function()
        if not targetItem or not targetItem:isItem() then 
            return 
        end

        local success = math.random(100) <= data.chance
        if not success then
            if curLvl > 0 then
                RefineSystem.removeBonuses(targetItem, curLvl)
                local base = targetItem:getType():getName()
                if curLvl-1 > 0 then
                    targetItem:setAttribute(ITEM_ATTRIBUTE_NAME, base .. " +" .. (curLvl-1))
                else
                    targetItem:setAttribute(ITEM_ATTRIBUTE_NAME, base)
                end
            end
            targetTile:getPosition():sendMagicEffect(RefineSystem.config.effectFail)
            return RefineSystem.sendUniqueMessage(player, RefineSystem.config.messages.failed)
        end

        RefineSystem.applyBonuses(targetItem, nextLvl)
        targetItem:setAttribute(ITEM_ATTRIBUTE_NAME,
            targetItem:getType():getName() .. " +" .. nextLvl)

        local desc = targetItem:getAttribute(ITEM_ATTRIBUTE_DESCRIPTION) or ""
        if not desc:find("This item was refined by") then
            targetItem:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION,
                desc .. "\nThis item was refined by " .. player:getName() .. ".")
        end

        targetTile:getPosition():sendMagicEffect(RefineSystem.config.effectSuccess)
        targetTile:getPosition():sendMagicEffect(RefineSystem.config.brilhante)
        RefineSystem.sendUniqueMessage(player,
            string.format(RefineSystem.config.messages.success, nextLvl))
    end, RefineSystem.config.refineDelay)

    return true
end

return RefineSystem