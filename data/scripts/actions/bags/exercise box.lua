local randomExercise = Action()

function randomExercise.onUse(player, item)
    local vocation = player:getVocation():getId()
    local exerciseWeapon

    -- Definir a exercise weapon baseada na vocação e skills
    if vocation >= 1 and vocation <= 4 then -- MS (Master Sorcerer)
        exerciseWeapon = 33087 -- weaponWand

    elseif vocation >= 5 and vocation <= 8 then -- ED (Elder Druid)
        exerciseWeapon = 33086 -- weaponRod

    elseif (vocation >= 9 and vocation <= 12) or (vocation >= 35 and vocation <= 39) then -- RP e vocações especiais
        exerciseWeapon = 33085 -- weaponBow

    elseif vocation >= 13 and vocation <= 26 then -- EK e outras vocações corpo a corpo
        -- Verifica a maior habilidade corpo a corpo
        local swordSkill = player:getSkillLevel(SKILL_SWORD)
        local axeSkill = player:getSkillLevel(SKILL_AXE)
        local clubSkill = player:getSkillLevel(SKILL_CLUB)

        if swordSkill >= axeSkill and swordSkill >= clubSkill then
            exerciseWeapon = 33082 -- weaponSword
        elseif axeSkill > swordSkill and axeSkill >= clubSkill then
            exerciseWeapon = 33083 -- weaponAxe
        else
            exerciseWeapon = 33084 -- weaponClub
        end
    else
        -- Caso padrão para vocações não identificadas
        exerciseWeapon = math.random(33082, 33087)
    end

    -- Dar a arma ao jogador
    player:sendTextMessage(19, "Você recebeu uma exercise weapon.")
    player:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
    player:addItem(exerciseWeapon, 10000)
    item:remove(1)
    
    return true
end

randomExercise:id(57449)
randomExercise:register()