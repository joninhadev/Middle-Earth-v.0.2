local function getArticle(str)
    return str:find("[AaEeIiOoUuYy]") == 1 and "an" or "a"
end

local function getMonthDayEnding(day)
    if day == "01" or day == "21" or day == "31" then
        return "st"
    elseif day == "02" or day == "22" then
        return "nd"
    elseif day == "03" or day == "23" then
        return "rd"
    else
        return "th"
    end
end

local function getMonthString(m)
    return os.date("%B", os.time{year = 1970, month = m, day = 1})
end

function onSay(player, words, param)
    local resultId = db.storeQuery("SELECT `id`, `name` FROM `players` WHERE `name` = " .. db.escapeString(param))
    if resultId ~= false then
        local targetGUID = result.getNumber(resultId, "id")
        local targetName = result.getString(resultId, "name")
        result.free(resultId)
        local str = ""
        local breakline = ""
        local deathCount = 0  -- Adicionado contador de mortes

        local resultId = db.storeQuery("SELECT `time`, `level`, `killed_by`, `is_player` FROM `player_deaths` WHERE `player_id` = " .. targetGUID .. " ORDER BY `time` DESC")
        if resultId ~= false then
            repeat
                if deathCount >= 10 then
                    break  -- Se atingir 10 mortes, sai do loop
                end

                if str ~= "" then
                    breakline = "\n"
                end
                local date = os.date("*t", result.getNumber(resultId, "time"))

                local article = ""
                local killed_by = result.getString(resultId, "killed_by")
                if result.getNumber(resultId, "is_player") == 0 then
                    article = getArticle(killed_by) .. " "
                    killed_by = killed_by:lower()
                end

                if date.day < 10 then date.day = "0" .. date.day end
                if date.hour < 10 then date.hour = "0" .. date.hour end
                if date.min < 10 then date.min = "0" .. date.min end
                if date.sec < 10 then date.sec = "0" .. date.sec end
                str = str .. breakline .. " " .. date.day .. getMonthDayEnding(date.day) .. " " .. getMonthString(date.month) .. " " .. date.year .. " " .. date.hour .. ":" .. date.min .. ":" .. date.sec .. "   Morto no Level " .. result.getNumber(resultId, "level") .. " por "  .. killed_by .. "."
                
                deathCount = deathCount + 1  -- Incrementa o contador de mortes

            until not result.next(resultId)
            result.free(resultId)
        end

        if str == "" then
            str = "Sem mortes."
        end
        player:popupFYI("Mortes do personagem, " .. targetName .. ".\n\n" .. str)
    else
        player:sendCancelMessage("O jogador com esse nome não existe.")
    end
    return false
end
