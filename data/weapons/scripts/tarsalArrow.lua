 local combat = Combat()
 combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
 combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
 combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_TARSALARROW)
 combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
	function onGetFormulaValues(player, skill, attack, factor)
		local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
		local min = (player:getLevel() / 2) + ((((distanceSkill / 3) + 1) * (attack / 3)) * 0.3)
		local max = (player:getLevel() / 2) + ((((distanceSkill / 3) + 1) * (attack / 3)) * 0.5)
		return -min, -max
	end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

 function onUseWeapon(player, variant)
	if player then
		if not player:isWarAllowed(CONST_WAR_ARROW) then
			player:sendCancelMessage("This action is not allowed here.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end
	end

 	return combat:execute(player, variant)
 end
