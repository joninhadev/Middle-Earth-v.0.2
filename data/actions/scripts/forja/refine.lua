--- Sistema de Upgrade de itens feito por Killua, XTibia.com.
--- Sistema feito com base no do Bronson Server

local vocations = {18, 19, 20, 21, 22}

local ids_bloqueados = {2642, 2643, 2195, 6132, 2640, 9932, 9933, 3982, 7886, 5462, 7457, 7892, 7891, 11303, 7893, 2645, 2641, 11118, 11117, 12646, 11240, 18406, 2646, 15410, 5907, 2456, 7438, 8854, 8856, 8855, 15643, 2455, 5947, 5803, 8853, 8852, 15644, 1294, 2410, 2389, 3965, 7367, 7378, 2425, 2399, 7366, 7368, 18435, 2547, 6529, 7363, 2543, 15648, 7840, 7839, 7838, 2352, 7365, 7364, 2544, 2546, 2545}

local controle = {
    {level = 0, quantOre = 1, chance = 85},
    {level = 1, quantOre = 2, chance = 75},
    {level = 2, quantOre = 3, chance = 65},
    {level = 3, quantOre = 4, chance = 60},
    {level = 4, quantOre = 5, chance = 45},
    {level = 5, quantOre = 6, chance = 40},
    {level = 6, quantOre = 7, chance = 35},
    {level = 7, quantOre = 8, chance = 30},
    {level = 8, quantOre = 9, chance = 25},
    {level = 9, quantOre = 10, chance = 20}
}


function isWeapon(uid) -- Function by Mock the bear.
    uid = uid or 0
    local f = getItemWeaponType(uid)
    if f == 1 or f == 2 or f == 3 then
        return true
    end
    return false     
end

function isShield(uid) -- Function by Mock the bear.
    uid = uid or 0
    if getItemWeaponType(uid) == 4 then
        return true
    end
    return false     
end

function getWeaponLevel(uid) -- Function by Mock the bear.
   uid = uid or 0
   local name = getItemName(uid)
   local lvl = string.match(name,'+(%d)')
   return tonumber(lvl) or 0
end



local upgrading = {
    upValue = function (value, level, percent)
    if value < 0 then return 0 end
        if level == 0 then return value end
            local nVal = value
            for i = 1, level do
                nVal = nVal + (math.ceil((nVal/100*percent)))
            end
            return nVal > 0 and nVal or value
        end,
    getLevel = function (item)
    local it, name = Item(item), ''
        if it then
            name = it:getName():split('+')
            if #name == 1 then
                return 0
            end
        else
            return 0
        end
        return math.abs(name[2])
    end
}



function onUse(cid, item, fromPosition, itemEx, toPosition)
    
    local chan = math.random(1, 100)
    
    if isInArray(ids_bloqueados, itemEx.itemid) or not isMovable(itemEx.uid) then
        return doPlayerSendCancel(cid, "Voce nao pode refinar esse item.")
    elseif not isInArray(vocations, getPlayerVocation(cid)) then
        return doPlayerSendCancel(cid, "Voce nao pode refinar.")
    elseif isCreature(itemEx.uid) then
        return doPlayerSendCancel(cid, "Voce nao pode refinar esse item")
    end

    local level = upgrading.getLevel(itemEx.uid)

    if isWeapon(itemEx.uid) then
        for u, cont_ in pairs(controle) do
            
            local atk = getWeaponLevel(itemEx.uid) == 0 and getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_ATTACK) or getItemAttribute(itemEx.uid,'attack')
            
            if level == cont_.level then
                if getPlayerItemCount(cid, 5880) >= cont_.quantOre then
                    if chan <= cont_.chance then
                        doItemSetAttribute(itemEx.uid, "attack",atk + 1)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce refinou com sucesso! Seu item agora é +" .. level + 1 .. "")
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                        doItemSetAttribute(itemEx.uid, 'name', getItemName(itemEx.itemid)..'+'..(level+1))
                        doItemSetAttribute(itemEx.uid, "description", "Este item foi refinado por " .. getCreatureName(cid) .. "")
                        doPlayerRemoveItem(cid, 5880, cont_.quantOre)
                    else
                        doTransformItem(itemEx.uid, 2256)
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce falhou.")
                        return true
                    end
                else
                    doPlayerSendCancel(cid, "Voce nao tem iron Ores o suficiente. Voce precisa de " .. cont_.quantOre .. " iron ores.")
                end
            elseif level == 10 then
                return doPlayerSendCancel(cid, "Este item ja esta no nivel maximo!.")
            end
        end
        
    elseif getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_ARMOR) > 0 then
        
        for u, cont_ in pairs(controle) do
            
            local arm = getWeaponLevel(itemEx.uid) == 0 and getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_ARMOR)  or getItemAttribute(itemEx.uid,'armor')
            
            if level == cont_.level then
                if getPlayerItemCount(cid, 5880) >= cont_.quantOre then
				
				
				
				
                    if chan <= cont_.chance then
					
                        doItemSetAttribute(itemEx.uid, 'armor',arm + 1)
                        doPlayerRemoveItem(cid, 5880, cont_.quantOre)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce refinou com sucesso! Seu item agora é +" .. level + 1 .. "")
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                        doItemSetAttribute(itemEx.uid, 'name', getItemName(itemEx.itemid)..' +'..(level+1))
                        doItemSetAttribute(itemEx.uid, "description", "Este item foi refinado por " .. getCreatureName(cid) .. "")
                        else
                        doTransformItem(itemEx.uid, 2256)
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce falhou.")
                    end
                else
                    doPlayerSendCancel(cid, "Voce nao tem iron Ores o suficiente. Voce precisa de " .. cont_.quantOre .. " iron ores.")
                end
            elseif level == 10 then
                return doPlayerSendCancel(cid, "Este item ja esta no nivel maximo!.")
            end
        end
    elseif isShield(itemEx.uid) then
        
        local def = getWeaponLevel(itemEx.uid) == 0 and getItemAttribute(itemEx.uid, ITEM_ATTRIBUTE_DEFENSE) or getItemAttribute(itemEx.uid,'defense')
        
        for u, cont_ in pairs(controle) do
            if level == cont_.level then
                if getPlayerItemCount(cid, 5880) >= cont_.quantOre then
                    if chan <= cont_.chance then
                        doItemSetAttribute(itemEx.uid, 'defense',def + 1)
                        doPlayerRemoveItem(cid, 5880, cont_.quantOre)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce refinou com sucesso! Seu item agora é +" .. level + 1 .. "")
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                        doItemSetAttribute(itemEx.uid, 'name', getItemName(itemEx.itemid)..' +'..(level+1))
                        doItemSetAttribute(itemEx.uid, "description", "Este item foi refinado por " .. getCreatureName(cid) .. "")
                    else
                        doTransformItem(itemEx.uid, 2256)
                        doSendMagicEffect(getThingPos(itemEx.uid), CONST_ME_CRAPS)
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce falhou.")
                    end
                else
                    doPlayerSendCancel(cid, "Voce nao tem iron Ores o suficiente. Voce precisa de " .. cont_.quantOre .. " iron ores.")
                end
            elseif level == 10 then
                return doPlayerSendCancel(cid, "Este item ja esta no nivel maximo!.")
            end
        end
    else
        doPlayerSendCancel(cid, "Voce nao pode refinar este item.")
    end
    return true
end