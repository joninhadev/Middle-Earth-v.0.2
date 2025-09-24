local warMode = {}

-- Configurações
warMode.minPlayersOnline = 1
warMode.minLevel = 1
warMode.checkInterval = 30 -- segundos
warMode.exhaustionTime = 1 -- segundos
warMode.storageExhaustion = 98772

-- Status da guerra
warMode.STATUS_INVITED = 0
warMode.STATUS_ACTIVE = 1
warMode.STATUS_REJECTED = 2
warMode.STATUS_CANCELLED = 3
warMode.STATUS_ENDED = 4

-- Função auxiliar para verificar membros online
local function hasMinimumMembersInGuild(guild)
    local membersOnline = guild:getMembersOnline()
    local total = 0
    for _, member in ipairs(membersOnline) do
        if member:getLevel() >= warMode.minLevel then
            total = total + 1
        end
    end
    return total >= warMode.minPlayersOnline
end

-- Função para verificar e finalizar guerras automaticamente
function warMode.checkWars()
    local time = os.time()
    local warsResult = db.storeQuery("SELECT * FROM guild_wars WHERE status = 1")
    
    if warsResult then
        repeat
            local warId = result.getNumber(warsResult, "id")
            local guild1 = result.getNumber(warsResult, "guild1")
            local guild2 = result.getNumber(warsResult, "guild2")
            local fragsLimit = result.getNumber(warsResult, "frags_limit") -- CORRIGIDO: frags_limit
            local name1 = result.getString(warsResult, "name1")
            local name2 = result.getString(warsResult, "name2")
            
            local warEnded = false
            
            -- Verifica frags da guild1
            local killsQuery1 = db.storeQuery("SELECT COUNT(*) as count FROM guildwar_kills WHERE warid = " .. warId .. " AND killerguild = " .. guild1)
            if killsQuery1 then
                local count1 = result.getNumber(killsQuery1, "count")
                result.free(killsQuery1)
                
                if count1 >= fragsLimit then
                    db.asyncQuery("UPDATE guild_wars SET status = 4, ended = " .. time .. " WHERE id = " .. warId)
                    Game.broadcastMessage(string.format("[WARMODE] A guild %s venceu a guerra contra %s com %d frags!", name1, name2, count1), MESSAGE_EVENT_ADVANCE)
                    warEnded = true
                end
            end
            
            -- Se a guerra não terminou, verifica frags da guild2
            if not warEnded then
                local killsQuery2 = db.storeQuery("SELECT COUNT(*) as count FROM guildwar_kills WHERE warid = " .. warId .. " AND killerguild = " .. guild2)
                if killsQuery2 then
                    local count2 = result.getNumber(killsQuery2, "count")
                    result.free(killsQuery2)
                    
                    if count2 >= fragsLimit then
                        db.asyncQuery("UPDATE guild_wars SET status = 4, ended = " .. time .. " WHERE id = " .. warId)
                        Game.broadcastMessage(string.format("[WARMODE] A guild %s venceu a guerra contra %s com %d frags!", name2, name1, count2), MESSAGE_EVENT_ADVANCE)
                    end
                end
            end
            
        until not result.next(warsResult)
        result.free(warsResult)
    end
    return true
end

-- Função principal do talkaction
function warMode.onSay(player, words, param)
    if player:getStorageValue(warMode.storageExhaustion) > os.time() then
        player:sendCancelMessage("You are exhausted.")
        return false
    end
    player:setStorageValue(warMode.storageExhaustion, os.time() + warMode.exhaustionTime)
    
    local guild = player:getGuild()
    if not guild then
        player:sendCancelMessage("Você precisa estar em uma Guild para usar esse comando.")
        return false
    end

    local params = param:split(',')
    local action = params[1] and params[1]:lower():trim() or nil
    local targetGuildName = params[2] and params[2]:trim() or nil

    if not action or not targetGuildName then
        player:popupFYI('Utilize o comando corretamente:' .. '\n\n' .. 
            'Para invitar warmode contra a guild Batmans por 30 frags:\n' .. 
            '--> !war invite,Batmans,30' .. '\n\n' .. 
            'Para aceitar o pedido de warmode contra a guild Zords:\n' .. 
            '--> !war accept,Zords' .. '\n\n' .. 
            'Para rejeitar o pedido de warmode da guild Zords:\n' .. 
            '--> !war reject,Zords' .. '\n\n' .. 
            'Para cancelar o pedido de warmode da guild Zords:\n' .. 
            '--> !war cancel,Zords' .. '\n\n' .. 
            'Para terminar a warmode contra a guild Zords:\n' .. 
            '--> !war end,Zords')
        return true
    end

    -- Verifica se a guild alvo existe
    local guildCheck = db.storeQuery("SELECT id FROM guilds WHERE name = " .. db.escapeString(targetGuildName))
    if not guildCheck then
        player:sendCancelMessage(string.format("A guild %s não existe.", targetGuildName))
        return false
    end
    local targetGuildId = result.getNumber(guildCheck, "id")
    result.free(guildCheck)

    local guildId, guildName = guild:getId(), guild:getName()

    -- Ações do comando
    if action == "invite" then
        if #params ~= 3 then
            player:sendCancelMessage('Por favor utilize o comando corretamente:\n!war invite, nome_da_guild_inimiga, frags\n\nExemplo:\n!war invite,Blackout,100')
            return false
        end

        if not hasMinimumMembersInGuild(guild) then
            player:sendCancelMessage(string.format('Você precisa ter no mínimo %d player%s online na sua Guild (level = %d).', 
                warMode.minPlayersOnline, warMode.minPlayersOnline ~= 1 and 's' or '', warMode.minLevel))
            return false
        end

        if targetGuildName:lower() == guildName:lower() then
            player:sendCancelMessage("Você não pode convidar sua própria guild para warmode.")
            return false
        end

        -- Verifica se já existe convite ou guerra ativa
        local checkQuery = db.storeQuery(string.format(
            "SELECT id FROM guild_wars WHERE ((guild1 = %d AND guild2 = %d) OR (guild1 = %d AND guild2 = %d)) AND status IN (0, 1)",
            guildId, targetGuildId, targetGuildId, guildId))
        if checkQuery then
            player:sendCancelMessage("Já existe um convite ou guerra ativa com esta guild.")
            result.free(checkQuery)
            return false
        end

        local fragsLimit = tonumber(params[3]:trim())
        if not fragsLimit or fragsLimit < 20 or fragsLimit > 999 then
            player:sendCancelMessage("A quantidade de frags deve ser entre 20 e 999.")
            return false
        end

        -- CORRIGIDO: usando frags_limit consistentemente
        db.query(string.format(
            "INSERT INTO guild_wars (guild1, guild2, name1, name2, status, started, ended, frags_limit) VALUES (%d, %d, %s, %s, %d, 0, 0, %d)",
            guildId, targetGuildId, db.escapeString(guildName), db.escapeString(targetGuildName), warMode.STATUS_INVITED, fragsLimit))
        
        Game.broadcastMessage(string.format('[WARMODE] %s convidou %s para warmode de %d frags!', 
            guildName, targetGuildName, fragsLimit), MESSAGE_EVENT_ADVANCE)

    elseif action == "accept" then
        if not hasMinimumMembersInGuild(guild) then
            player:sendCancelMessage(string.format('Você precisa ter no mínimo %d player%s online na sua Guild (level = %d).', 
                warMode.minPlayersOnline, warMode.minPlayersOnline ~= 1 and 's' or '', warMode.minLevel))
            return false
        end

        local acceptQuery = db.storeQuery(string.format(
            "SELECT id, guild1, frags_limit FROM guild_wars WHERE status = 0 AND guild2 = %d AND name1 = %s",
            guildId, db.escapeString(targetGuildName)))
        
        if not acceptQuery then
            player:sendCancelMessage('Não há convite pendente desta guild.')
            return false
        end

        local warId = result.getNumber(acceptQuery, "id")
        local inviterGuildId = result.getNumber(acceptQuery, "guild1")
        local fragsLimit = result.getNumber(acceptQuery, "frags_limit") -- Buscando o frags_limit correto
        result.free(acceptQuery)

        if inviterGuildId == guildId then
            player:sendCancelMessage('Você não pode aceitar um convite que você enviou.')
            return false
        end

        db.query(string.format("UPDATE guild_wars SET status = 1, started = %d WHERE id = %d", os.time(), warId))
        Game.broadcastMessage(string.format('[WARMODE] %s aceitou o warmode contra %s de %d frags!', guildName, targetGuildName, fragsLimit), MESSAGE_EVENT_ADVANCE)


    elseif action == "reject" then
        local rejectQuery = db.storeQuery(string.format(
            "SELECT id, guild1 FROM guild_wars WHERE status = 0 AND guild2 = %d AND name1 = %s",
            guildId, db.escapeString(targetGuildName)))
        
        if not rejectQuery then
            player:sendCancelMessage('Não há convite pendente desta guild.')
            return false
        end

        local warId = result.getNumber(rejectQuery, "id")
        local inviterGuildId = result.getNumber(rejectQuery, "guild1")
        result.free(rejectQuery)

        if inviterGuildId == guildId then
            player:sendCancelMessage('Você não pode rejeitar um convite que você enviou.')
            return false
        end

        db.query(string.format("UPDATE guild_wars SET status = 2 WHERE id = %d", warId))
        player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Você rejeitou o warmode de %s.', targetGuildName))

    elseif action == "end" then
        local endQuery = db.storeQuery(string.format(
            "SELECT id FROM guild_wars WHERE status = 1 AND ((guild1 = %d AND guild2 = %d) OR (guild1 = %d AND guild2 = %d))",
            guildId, targetGuildId, targetGuildId, guildId))
        
        if not endQuery then
            player:sendCancelMessage('Não há guerra ativa com esta guild.')
            return false
        end

        local warId = result.getNumber(endQuery, "id")
        result.free(endQuery)

        db.query(string.format("UPDATE guild_wars SET status = 4, ended = %d WHERE id = %d", os.time(), warId))
        Game.broadcastMessage(string.format('[WARMODE] %s encerrou a guerra contra %s!', guildName, targetGuildName), MESSAGE_EVENT_ADVANCE)

    elseif action == "cancel" then
        local cancelQuery = db.storeQuery(string.format(
            "SELECT id FROM guild_wars WHERE status = 0 AND guild1 = %d AND name2 = %s",
            guildId, db.escapeString(targetGuildName)))
        
        if not cancelQuery then
            player:sendCancelMessage('Não há convite pendente para esta guild.')
            return false
        end

        local warId = result.getNumber(cancelQuery, "id")
        result.free(cancelQuery)

        db.query(string.format("UPDATE guild_wars SET status = 3 WHERE id = %d", warId))
        player:sendTextMessage(MESSAGE_INFO_DESCR, string.format('Você cancelou o convite para %s.', targetGuildName))

    else
        player:sendCancelMessage("Ação inválida. Use: invite, accept, reject, end ou cancel.")
    end

    return false
end

-- Registro do talkaction
local talkaction = TalkAction("!war")

function talkaction.onSay(player, words, param)
    return warMode.onSay(player, words, param)
end

talkaction:separator(" ")
talkaction:register()

-- Registro do globalevent
local globalevent = GlobalEvent("WarModeCheck")

function globalevent.onThink(interval)
    return warMode.checkWars()
end

globalevent:interval(warMode.checkInterval * 1000) -- Convertendo para milissegundos
globalevent:register()