 local combat = Combat()
 combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
 combat:setParameter(COMBAT_PARAM_EFFECT, 1)
 combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_CRYSTALLINEARROW)
 combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
	function onGetFormulaValues(player, skill, attack, factor)
		local distanceSkill = player:getEffectiveSkillLevel(SKILL_DISTANCE)
		local min = (player:getLevel() * 1.3) + ((((distanceSkill / 3) + 1) * (attack / 4)) * 0.4)
		local max = (player:getLevel() * 1.3) + ((((distanceSkill / 3) + 1) * (attack / 4)) * 0.6)
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
