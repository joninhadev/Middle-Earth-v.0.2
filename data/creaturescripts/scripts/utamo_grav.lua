function onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)

    if primaryType == COMBAT_HEALING or secondaryType == COMBAT_HEALING then
        return primaryDamage, primaryType, secondaryDamage, secondaryType
    end
  
    if creature and creature:isPlayer() then
            if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, 56) then
                creature:getPosition():sendMagicEffect(CONST_ME_YELLOWENERGY)
                primaryDamage = primaryDamage * 0.90
                secondaryDamage = secondaryDamage * 0.90
            end
    end
return primaryDamage, primaryType, secondaryDamage, secondaryType
end