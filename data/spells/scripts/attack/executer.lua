local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, TRUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
if (isPlayer(target)) then
	if (getCreatureHealth(target) > getCreatureMaxHealth(target) * 0.15) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "O alvo tem que estar com menos de 15% da vida.")
	return false
	end
else
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Você só pode usar em jogadores.")
return false
end
	local storage = 23011
        local hp = -1000000
	local chance = math.random(1, 4)

		if chance == 1 then
		doSendMagicEffect(getPlayerPosition(cid), 49)
		doCreatureAddHealth(target, hp)
                return doCombat(cid, combat, var)
          elseif chance == 2 then
				doSendMagicEffect(getPlayerPosition(cid), 49)
		doCreatureAddHealth(target, hp)
                return doCombat(cid, combat, var)
          elseif chance == 3 then
				doSendMagicEffect(getPlayerPosition(cid), 2)
          
        elseif chance == 4 then
				doSendMagicEffect(getPlayerPosition(cid), 2)
				end
end
