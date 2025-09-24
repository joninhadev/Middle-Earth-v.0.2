local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	creature:removeCondition(CONDITION_MANASHIELD)
	return combat:execute(creature, var)
end

spell:group("support")
spell:id(245)
spell:name("Cancel Magic Shield")
spell:words("exana vita")
spell:level(14)
spell:mana(50)
spell:isAggressive(false)
spell:isSelfTarget(true)
spell:cooldown(1 * 3000)
spell:groupCooldown(1 * 1000)
spell:needLearn(false)
spell:vocation("druid;true", "elder druid;true", "celtic druid;true", "spirit healer; true", "sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "royal archer;true", "medieval archer;true", "executioner;true", "high elf;true", "elven elite;true", "elf ranger;true")
spell:register()