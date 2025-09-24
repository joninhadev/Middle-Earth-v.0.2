function onSpeak(player, type, message)
    local playerAccountType = player:getAccountType()

    -- Impede que jogadores de nível 1 falem em canais se não forem Game Master
    if player:getLevel() == 1 and playerAccountType < ACCOUNT_TYPE_GAMEMASTER then
        player:sendCancelMessage("You may not speak into channels as long as you are on level 1.")
        return false
    end

    -- Se o jogador for Tutor ou superior, ele sempre fala em laranja (TALKTYPE_CHANNEL_O)
    if playerAccountType >= ACCOUNT_TYPE_TUTOR then
        type = TALKTYPE_CHANNEL_O
    else
        -- Lógica para canais de comunicação existentes para contas não-Tutor
        if type == TALKTYPE_CHANNEL_Y then
            if playerAccountType >= ACCOUNT_TYPE_GAMEMASTER then
                type = TALKTYPE_CHANNEL_O
            end
        elseif type == TALKTYPE_CHANNEL_O then
            if playerAccountType < ACCOUNT_TYPE_GAMEMASTER then
                type = TALKTYPE_CHANNEL_Y
            end
        elseif type == TALKTYPE_CHANNEL_R1 then
            if playerAccountType < ACCOUNT_TYPE_GAMEMASTER and not getPlayerFlagValue(player, PlayerFlag_CanTalkRedChannel) then
                type = TALKTYPE_CHANNEL_Y
            end
        end
    end

    return type
end
