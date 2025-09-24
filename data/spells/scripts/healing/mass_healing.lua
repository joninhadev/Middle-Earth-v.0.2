local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, FALSE)

function onGetFormulaValues(cid, level, maglevel)
	local min = (level * 1.5 + maglevel * 1.5) * 2.08
	local max = (level * 2.0 + maglevel * 2.0) * 2.2
	if min < 250 then
		min = 250
		max = 250
	end
	return min, max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end