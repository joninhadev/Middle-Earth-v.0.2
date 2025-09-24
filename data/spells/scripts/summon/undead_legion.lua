--modificado por Bronson para ter diferentes summons
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_SOUND_BLUE)

local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onTargetCorpse(cid, pos)
	local getPos = pos
	getPos.stackpos = 255
	corpse = getThingfromPos(getPos)
	if(corpse.uid > 0 and isCreature(corpse.uid) == FALSE and isInArray(CORPSES, corpse.itemid) == TRUE) then
		
		local level = getPlayerLevel(cid)
		local count = getCreatureSummons(cid)
		local mname = "ghoul"
		
		if count < 4 then
			doRemoveItem(corpse.uid)
			
			if level < 40 then mname = "ghoul"
			elseif level < 55 then mname = "tarantula"
			elseif level < 70 then mname = "scarab"
			elseif level < 85 then mname = "dark monk"
			elseif level < 100 then mname = "minotaur mage"
			elseif level < 115 then mname = "beholder"
			elseif level < 130 then mname = "demon skeleton"
			elseif level < 200 then mname = "elder beholder"
			elseif level >= 200 then mname = "wyvern"
			end
			
			local tira = -(count * 500)
			
			if( doCreatureAddMana(cid, tira) == 0 ) then
				local monst = doSummonCreature(mname,pos)
				doConvinceCreature(cid, monst)
				return TRUE
			end
			
		end
	end
end

setCombatCallback(combat, CALLBACK_PARAM_TARGETTILE, "onTargetCorpse")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
