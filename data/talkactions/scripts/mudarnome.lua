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
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "Você deve botar um nome.")
	elseif(getPlayerGUIDByName(param) ~= nil) then
		textCancel = "Esse nome já está sendo usado."
	elseif(getPlayerPremiumDays(cid) < 6) then
		textCancel = "Você não tem os dias de VIP necessários."
	elseif(not getTilePzInfo(getCreaturePosition(cid))) then
		textCancel = "Você deve estar em uma área PZ para mudar o nome."
	elseif(string.len(tostring(param)) >= config.maxTextLenght) then
		textCancel = "Você pode usar no máximo " .. config.maxTextLenght .. " caracteres."
	elseif(string.find(param:lower(), "[^%l%s]") ~= nil) then
		textCancel = "Você não podeusar símbolos."
	else
		for blacklist = 1, table.maxn(config.blacklistParam) do
			if(string.find(param:lower(), config.blacklistParam[blacklist]) ~= nil) then
				textCancel = "Nome inválido."
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
			doPlayerSendCancel(cid, "Nome inválido.")
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
 
	doPlayerSendTextMessage(cid, 25, " Você será kikado em " .. config.delay .. " segundos.")
	addEvent(function(cid, forceLogout)
		if(isPlayer(cid)) then
			doRemoveCreature(cid, forceLogout)
		end
	end, config.delay * 1000, cid, false)
 
	return true
end