function onSay(cid, words, param, channel)
local player = Player(cid)
	if not player:getGroup():getAccess() then
		return true
	end
	
local looktypes = {1773, 1774, 1775, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785, 1786, 1787, 1759, 1760, 1788, 1789, 1790, 1791, 1792, 1793, 1794, 1795, 1796, 1797, 1798, 1799, 1800, 1802}
if(not param) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Gives player ability to wear all addons, example: /addons Player Name")
end

	local pid = 0
	if(param == '') then
		pid = getCreatureTarget(cid)
		if(pid == 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Unlocks all addons for certain player. Usage: /addons Player Name")
			return false
		end
	else
		pid = getPlayerByName(param)
	end
	
	if(not pid) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " is not currently online.")
		return false
	end
	
	if getPlayerAccountType(pid) > getPlayerAccountType(cid) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cannot perform action.")
		return false
	end
	
	for i = 1, #looktypes do
	doPlayerAddOutfit(pid, looktypes[i], 3)
	end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "All addons unlocked for " .. getCreatureName(pid) .. ".")
	doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[Server]: All addons unlocked.")
	return false
end