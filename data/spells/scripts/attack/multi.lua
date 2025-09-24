local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
	local skill = getPlayerSkill(cid, 4)
	local ml = getPlayerMagLevel(cid)

	local dmg = (ml*0.5)+(skill* 1.7)*1.8
	local damage = -((math.random(dmg/2,dmg)))

	return damage, damage --The random part of the formula has already been made, just return the normal damage
end
setCombatCallback(combat1, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
	local skill = getPlayerSkill(cid, 4)
	local ml = getPlayerMagLevel(cid)

	local dmg = (ml*0.5)+(skill* 1.3)*1.8
	local damage = -((math.random(dmg/2,dmg)))

	return damage, damage --The random part of the formula has already been made, just return the normal damage
end
setCombatCallback(combat2, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
	local skill = getPlayerSkill(cid, 4)
	local ml = getPlayerMagLevel(cid)

	local dmg = (ml*0.5)+(skill*  1.5)*1.8
	local damage = -((math.random(dmg/2,dmg)))

	return damage, damage --The random part of the formula has already been made, just return the normal damage
end
setCombatCallback(combat3, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_INFERNALBOLT)
function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
	local skill = getPlayerSkill(cid, 4)
	local ml = getPlayerMagLevel(cid)

	local dmg = (ml*0.5)+(skill* 1.4)*1.8
	local damage = -((math.random(dmg/2,dmg)))

	return damage, damage --The random part of the formula has already been made, just return the normal damage
end
setCombatCallback(combat4, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")




arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}



local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)


local function onCastSpell1(parameters)
doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat2, parameters.var)
end
local function onCastSpell3(parameters)
doCombat(parameters.cid, combat3, parameters.var)
end
local function onCastSpell4(parameters)
doCombat(parameters.cid, combat4, parameters.var)
end





function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3, combat4 = combat4}
addEvent(onCastSpell1, 1, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 900, parameters)


return TRUE
end