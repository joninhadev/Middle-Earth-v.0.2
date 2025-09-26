local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

local function getHealAmount(level, maglevel)
    local min = (level * 1.5 + maglevel * 1.5) * 2.08
    local max = (level * 2.0 + maglevel * 2.0) * 2.2
    if min < 250 then
        min, max = 250, 250
    end
    return min, max
end

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)

    doCombat(cid, combat, var)
	
    local pos = getThingPos(cid)
    local spectators = getSpectators(pos, 3, 3, false)
    if spectators then
        for _, target in ipairs(spectators) do
            if isPlayer(target) then
                local min, max = getHealAmount(getPlayerLevel(cid), getPlayerMagLevel(cid))
                doTargetCombatHealth(cid, target, COMBAT_HEALING, min, max, CONST_ME_NONE)
            end
        end
    end
    return true
end
