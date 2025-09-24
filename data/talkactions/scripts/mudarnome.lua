local config = {
	maxTextLenght = 15, -- Maximum Text Length
	blacklistParam = {"character", "account manager", "god", "cm", "gm", "tutor", "tester", "testing", "target dummy"}, -- Black listed content
	minWordLenght = 3, -- Minimum of 3 letters per word
	newMethod = false, -- TRUE only if you are using new 0.3.7+
	delay = 1 -- Delay to get kicked
}
 
function onSay(cid, words, param, channel)
	local textCancel = config.text
	if(param == '') then
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Voc� deve botar um nome.")
	elseif(getPlayerGUIDByName(param) ~= nil) then
		textCancel = "Esse nome j� est� sendo usado."
	elseif(getPlayerPremiumDays(cid) < 6) then
		textCancel = "Voc� n�o tem os dias de VIP necess�rios."
	elseif(not getTilePzInfo(getCreaturePosition(cid))) then
		textCancel = "Voc� deve estar em uma �rea PZ para mudar o nome."
	elseif(string.len(tostring(param)) >= config.maxTextLenght) then
		textCancel = "Voc� pode usar no m�ximo " .. config.maxTextLenght .. " caracteres."
	elseif(string.find(param:lower(), "[^%l%s]") ~= nil) then
		textCancel = "Voc� n�o podeusar s�mbolos."
	else
		for blacklist = 1, table.maxn(config.blacklistParam) do
			if(string.find(param:lower(), config.blacklistParam[blacklist]) ~= nil) then
				textCancel = "Nome inv�lido."
				break
			end
		end
	end
 
	if(config.text ~= textCancel) then
		doPlayerSendCancel(cid, textCancel)
		return true
	end
 
	local paramTemp, space, oldName = '', '', getCreatureName(cid)
	for word in string.gmatch(param, "%a+") do
		if(string.len(word) < config.minWordLenght) then
			doPlayerSendCancel(cid, "Nome inv�lido.")
			return true
		end
 
		paramTemp, space = "" .. paramTemp .. "" .. space .. "" .. word .. "", " "
	end
 
	local guid = getPlayerGUID(cid)
	param = paramTemp
	doPlayerRemovePremiumDays(cid, 6)
	if(config.newMethod == true) then
		doPlayerChangeName(guid, oldName, param)
	else
		db.executeQuery("UPDATE `players` SET `name` = " .. db.escapeString(param) .. " WHERE `id` = " .. guid .. ";")
	end
 
	doPlayerSendTextMessage(cid, 25, " Voc� ser� kikado em " .. config.delay .. " segundos.")
	addEvent(function(cid, forceLogout)
		if(isPlayer(cid)) then
			doRemoveCreature(cid, forceLogout)
		end
	end, config.delay * 1000, cid, false)
 
	return true
end