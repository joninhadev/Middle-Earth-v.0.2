function onSay(cid, words, param)
	local prisao = {x = 492, y = 45, z = 7}
	local saida = {x = 511, y = 89, z = 7}
	local STORAGE_JAIL = 50026
	local creature = Creature(param)

local info = [[Comandos JAIL:
/prender NOME : prende um jogador por um certo tempo.
/liberar : libera o jogador da prisão.
]]
	

	if words == '/prender' then
		if(param == '') then
			doPlayerPopupFYI(cid,info)
			return true
		end
	
		local t = string.explode(param, ",")
		local vtr = getPlayerName(t[1])
		
		if(not t[1]) then
			doPlayerSendTextMessage(cid, 21, "Digite o nome do jogador. Exemplo: /prender Wilson.")
			return true
		end
		
		if isPlayer(vtr) then
		if getPlayerLevel(cid) >= 1 then
			if getPlayerStorageValue(vtr, storage_x) < 0 then
				setPlayerStorageValue(vtr, storage_x, 0)
			end
			local jail_time = getPlayerStorageValue(vtr, storage_x)
			if jail_time < 0 then
				jail_time = 0 
			end
			local tempo2 = jail_time
			setPlayerStorageValue(vtr, storage_x, tempo2)
			local tempo = (0+1)* 24 * 60 * 60
			Game.broadcastMessage("O jogador "..t[1].." foi preso por 1 dia, pelo uso de MC na mesma party.", BroadCast_Type)
			setPlayerStorageValue(vtr, STORAGE_JAIL, os.time()+tempo)
            doPlayerSendTextMessage (vtr, MESSAGE_INFO_DESCR, 'Você está preso até ' .. os.date("%d/%m/%Y \nHora: %H:%M:%S", getPlayerStorageValue(vtr, STORAGE_JAIL)) .. '') 
			creature:teleportTo(prisao)
			doPlayerSetTown(vtr, 17)
	
			
end
			else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Player com esse nome não existe ou não está online.")
		end
		
    elseif words == '/liberar' then
	    local saida = {x = 511, y = 89, z = 7}
		local t = string.explode(param, ",")
		local vtr = getPlayerName(t[1])
		local dias_removidos = 5 ----- AQUI! -----
		local storage_aviso = 59983
		local creature = Creature(param)
		
		
		if getPlayerGroupId(cid) >= 5 then
				if isPlayer(vtr) then
				if getPlayerStorageValue(vtr, STORAGE_JAIL) > os.time() then
					 creature:teleportTo(saida)
					
					setPlayerStorageValue(vtr, STORAGE_JAIL, os.time()+1)
					doPlayerSendTextMessage(vtr,MESSAGE_INFO_DESCR, getCreatureName(cid) .. ' liberou você da prisão.')
					doPlayerSendTextMessage (cid, MESSAGE_INFO_DESCR, 'Você liberou o jogador '.. getCreatureName(vtr) ..' da prisão.')
				else
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "O jogador "..getCreatureName(vtr).." não esta preso.")
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Player com esse nome não existe ou não está online.")
			end
	end
	end
    return true
end  