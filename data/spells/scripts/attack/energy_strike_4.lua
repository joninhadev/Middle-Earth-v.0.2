local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0.07, -95, -0.09, -130)

local distanceCombat = createCombatObject()
setCombatParam(distanceCombat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(distanceCombat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(distanceCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(distanceCombat, COMBAT_FORMULA_LEVELMAGIC, -0.07, -95, -0.09, -130)

function onCastSpell(cid, var)
	if(variantToNumber(var) ~= 0) then
		return doCombat(cid, distanceCombat, var)
	end
	return doCombat(cid, combat, var)
end