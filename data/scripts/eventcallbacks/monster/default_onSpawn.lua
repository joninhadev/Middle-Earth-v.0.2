local event = Event()
event.onSpawn = function(monster, position, startup, artificial)
	if not monster:getType():canSpawn(position) then
		return false
	end

	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
	return true
end

event:register()
