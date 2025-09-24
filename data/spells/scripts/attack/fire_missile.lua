local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function getCombatFormulas(cid, lv, maglv)
    local player = Player(cid)
    local vocationId = player:getVocation():getId()

    local formula_min, formula_max
		
    if vocationId == 10 or vocationId == 11 or vocationId == 12 or vocationId == 38 or vocationId == 39 then -- RP | ELF
	
	    formula_min = ((lv * -0.7 + maglv * - 10.2) * 1.3)
        formula_max = ((lv * -0.9 + maglv * - 10.5) * 1.5)
	
	elseif vocationId == 2 or vocationId == 3 or vocationId == 4 then -- MS 
	
		local level_term_min = (lv * -4.2) * 0.40
		local magic_term_min = (maglv * -14.1) * 0.40 * 1.20
		formula_min = level_term_min + magic_term_min

		local level_term_max = (lv * -4.2) * 0.45
		local magic_term_max = (maglv * -14.1) * 0.45 * 1.30
		formula_max = level_term_max + magic_term_max
	
	else
	
		local level_term_min = (lv * -4.2) * 0.40
		local magic_term_min = (maglv * -14.1) * 0.40 * 1.15
		formula_min = level_term_min + magic_term_min

		local level_term_max = (lv * -4.2) * 0.45
		local magic_term_max = (maglv * -14.1) * 0.45 * 1.15
		formula_max = level_term_max + magic_term_max


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
