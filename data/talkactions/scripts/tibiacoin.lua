function onSay(player, words, param, channel)

local pegarcoins = player:getCoinsBalance()

	
function getContainerSlotsFree(container) -- by vodka
return getContainerCap(container)-getContainerSize(container)
end
function getAllContainerFree(container)  -- by vodka
local containers,soma = {},0
for i = 0, getContainerSize(container)-1 do
local item = getContainerItem(container, i)
if isContainer(item.uid) then
table.insert(containers, item.uid)
end
end
for _, check in pairs(containers) do
soma = soma + getContainerSlotsFree(check)
end
return (soma + getContainerSlotsFree(container))
end
	
	if param == '' then
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa colocar a quantidade de coins que quer gerar.")
		return false
	end

	if(not tonumber(param)) or (tonumber(param) <= 0) then
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Esse valor é inválido.")
		return false
	end
	
		if(player:getLevel() < 50) then
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você precisa ser no minimo level 50 para gerar coins.")
		return false
	end
	
					   local eu,vc  = getContainerSlotsFree(player:getSlotItem(3).uid)
                   if eu == 0 then
                         player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você não tem espaço na backpack principal.")
                   return false
                   end
				   
	
	if (pegarcoins < tonumber(param)) then
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você não tem essa quantidade de coins.")
		return false
	end
		

			if( tonumber(param) > 100) then
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "O maximo por !coins é 100 coins")
		return false
	end
	
	
	
    db.query("UPDATE `accounts` SET `coins` = `coins` - '" .. param .. "' WHERE `id` = '" .. player:getAccountId() .. "';")
	player:addItem (24774, param)
	if tonumber(param) == 1 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu "..param.." coins em item.")
	else
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Você recebeu "..param.." coins em item.")
	end
	return false
end