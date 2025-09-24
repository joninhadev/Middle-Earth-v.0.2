local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_STUN)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)

function getSpellDamage(cid, weaponSkill, weaponAttack, attackStrength)
    local minWeaponDamage = weaponAttack * weaponSkill * 0.15
    local maxWeaponDamage = weaponAttack * weaponSkill * 0.20

    local damage = -(minWeaponDamage + math.random() * (maxWeaponDamage - minWeaponDamage))
    return damage, damage
end

setCombatCallback(combat, CALLBACK_PARAM_SKILLVALUE, "getSpellDamage")

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionFormula(condition, -0.6, 0.6, -0.6, 0.6)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end
