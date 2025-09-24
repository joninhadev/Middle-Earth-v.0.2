local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function getCombatFormulas(cid, lv, maglv)
    local player = Player(cid)
    local vocationId = player:getVocation():getId()

    local formula_min, formula_max
	
	if vocationId == 2 or vocationId == 3 or vocationId == 4 or vocationId == 24 or vocationId == 25 then --- VOCAÇÃO MS
	
		formula_min = ((lv * -0.9 + maglv * -13.0) * 0.75)
		formula_max = ((lv * -0.95 + maglv * -15.0) * 0.82)
	
	else	
		formula_min = ((lv * -0.2 + maglv * -16.0) * 0.55) -- OUTRAS VOCAÇÕES 
		formula_max = ((lv * -0.2 + maglv * -16.0) * 0.55)
    end

    if formula_max < formula_min then
        local tmp = formula_max
        formula_max = formula_min
        formula_min = tmp
    end
return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")



function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
