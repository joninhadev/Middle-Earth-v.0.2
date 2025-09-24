local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)

function getCombatFormulas(cid, lv, maglv)
    local player = Player(cid)
    local vocationId = player:getVocation():getId()

    local formula_min, formula_max
	
    if vocationId == 10 or vocationId == 11 or vocationId == 12 then --- VOCAÇÃO RP 
	
		formula_min = ((lv * - 1.2 + maglv * -5.0) * 0.55)
		formula_max = ((lv * - 1.2 + maglv * -5.0) * 0.65)
	
	elseif vocationId == 2 or vocationId == 3 or vocationId == 4 then --- VOCAÇÃO MS
	
		formula_min = ((lv * -1.592 + maglv * -3.714) * 0.60027)
		formula_max = ((lv * -1.592 + maglv * -4.344) * 0.6502925)
		
	else

		formula_min = ((lv * -1.592 + maglv * -3.714) * 0.57783)
		formula_max = ((lv * -1.592 + maglv * -4.344) * 0.6259825)		
		
	end

    if formula_max < formula_min then
        local tmp = formula_max
        formula_max = formula_min
        formula_min = tmp
    end
return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")


local area = createCombatArea(AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end