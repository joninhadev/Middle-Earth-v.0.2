--[[
- hora deve ser exata SERVER
- para fazer o raid tera que ser ex: 00 hour(horas) e 00 minu (minutos)
- para fazer a raid na data e hora no tempo exato, uso "exact"
- para fazer a raid ocorrer todas as semanas (pelo menos 1x na semana) uso "weekly"
- o nome dos dias sao ultilizados apenas para o tipo semanal que devera ser
- "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"
- tambem devem estar dentro de uma matriz-> {}
]]

local raids =
        {
                [1] =
                        {
                                name = 'Crystal Wolf',
                                type = 'weekly',
                                days = {'sunday'},
                                hour = 16,
                                minu = 00
                        },
                
				[2] =
                        {
                                name = 'Crustacea Gigantica',
                                type = 'weekly',
                                days = {'monday'},
                                hour = 16,
                                minu = 00
                        },
						
				[3] =
                        {
                                name = 'Noble Lion',
                                type = 'weekly',
                                days = {'tuesday'},
                                hour = 16,
                                minu = 00
                        },
						
			    [4] =
                        {
                                name = 'Undead Cavebear',
                                type = 'weekly',
                                days = {'wednesday'},
                                hour = 16,
                                minu = 00
                        },
						
				[5] =
                        {
                                name = 'Midnight Panther',
                                type = 'weekly',
                                days = {'thursday'},
                                hour = 16,
                                minu = 00
                        },
						
				[6] =
                        {
                                name = 'Draptor',
                                type = 'weekly',
                                days = {'friday'},
                                hour = 16,
                                minu = 00
                        },
						
				[7] =
                        {
                                name = 'Sandstone Scorpion',
                                type = 'weekly',
                                days = {'saturday'},
                                hour = 16,
                                minu = 00
                        },
                [8] =
                        {
                                name = 'Inferno',
                                type = 'weekly',
                                days = {'sunday'},
                                hour = 21,
                                minu = 00
                        },
                
				[9] =
                        {
                                name = 'Drakes',
                                type = 'weekly',
                                days = {'monday'},
                                hour = 19,
                                minu = 00
                        },
						
				[10] =
                        {
                                name = 'quara',
                                type = 'weekly',
                                days = {'tuesday'},
                                hour = 19,
                                minu = 00
                        },
						
			    [11] =
                        {
                                name = 'pirata',
                                type = 'weekly',
                                days = {'wednesday'},
                                hour = 20,
                                minu = 00
                        },
						
				[12] =
                        {
                                name = 'Jorge',
                                type = 'weekly',
                                days = {'thursday'},
                                hour = 20,
                                minu = 00
                        },
						
				[13] =
                        {
                                name = 'Eddie',
                                type = 'weekly',
                                days = {'friday'},
                                hour = 20,
                                minu = 00
                        },
						
				[14] =
                        {
                                name = 'baby sladran',
                                type = 'weekly',
                                days = {'saturday'},
                                hour = 22,
                                minu = 00
                        },
						
						
				
        }
        
local last_execsutes = {}

function onThink(interval, lastExecution, thinkInterval)
        local static_time = os.time()
        for k, raid in ipairs(raids) do
                if (raid.type == 'weekly') then
                        local day = os.date("%A", static_time):lower()
                        if isInArray(raid.days, day) then
                                local hour = tonumber(os.date("%H", static_time))
                                if (raid.hour == hour) then
                                        local minute = tonumber(os.date("%M", static_time))
                                        if (raid.minu == minute) then
                                                local day_number = tonumber(os.date("%d", static_time))
                                                if (last_execsutes[k] ~= day_number) then
                                                        last_execsutes[k] = day_number
                                                        Game.startRaid(raid.name)
                                                end
                                        end
                                end
                        end
                elseif (raid.type == 'exact') then
                        local month = tonumber(os.date("%m", static_time))
                        if (raid.date.month == month) then
                                local day = tonumber(os.date("%d", static_time))
                                if (raid.date.day == day) then
                                        local hour = tonumber(os.date("%H", static_time))
                                        if (raid.hour == hour) then
                                                local minute = tonumber(os.date("%M", static_time))
                                                if (raid.minu == minute) then
                                                        if (last_execsutes[k] ~= day) then
                                                                last_execsutes[k] = day
                                                                Game.startRaid(raid.name)
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
        return true
end