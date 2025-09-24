local id = 1499
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, id)

function tile_timer(id, pos, delay, color)
    if getTileItemById(pos, id).uid == 0 then
        return true
    end

    if delay ~= 1 then
        addEvent(tile_timer, 1000, id, pos, delay - 1, color)
    end

    local people = Game.getSpectators(pos, 7, 7, 5, 5, false, true)
    if not people then
        return true
    end

    for i = 1, #people do
        people[i]:sendTextMessage(MESSAGE_EXPERIENCE, "Wild growth will disappear in " .. delay .. " second" .. (delay > 1 and "s" or "") .. ".", pos, delay, color)
    end
end

function removeMw(pos, mw)
    local tile = Tile(pos)
    mw = tile:getItemById(mw)
    if mw then mw:remove() end
end

function onCastSpell(creature, var)
    local c = doCombat(creature, combat, var)
    if c then
        local pos = variantToPosition(var)
        local wall = Game.createItem(id, 1, pos)
        addEvent(removeMw, 40000, pos, id)
        tile_timer(id, pos, 40, TEXTCOLOR_LIGHTBLUE)
    end
    return c
end
