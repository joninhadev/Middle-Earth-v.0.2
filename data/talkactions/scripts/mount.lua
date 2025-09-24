function onSay(cid, words, param, channel)

function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end


		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Command requires param.")

		return true

	end



	local t = string.explode(param, ", ")

	t[1] = tonumber(t[1])

	if(not t[1]) then

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Command requires numeric param.")

		return true

	end



	local pid = cid

	if(t[2]) then

		pid = getPlayerName(t[2])

		if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then

			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Player " .. t[2] .. " not found.")

			return true

		end

	end



	doPlayerAddMount(pid, t[1])
	doPlayerSendTextMessage(pid, MESSAGE_STATUS_DEFAULT, "Parabens, voce recebeu sua montaria !")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "A montaria para o Player " .. t[2] .. " foi adicionada com sucesso.")

	return true

end
