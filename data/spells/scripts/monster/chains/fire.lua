local dmgType = COMBAT_FIREDAMAGE
local effect = 16
local minDmg = 550
local maxDmg = 800


local function getDiagonalDistance(pos1, pos2)
	local dstX = math.abs(pos1.x - pos2.x)
	local dstY = math.abs(pos1.y - pos2.y)
	if dstX > dstY then
		return 14 * dstY + 10 * (dstX - dstY)
	else
		return 14 * dstX + 10 * (dstY - dstX)
	end
end

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, dmgType)
combat:setParameter(COMBAT_PARAM_EFFECT, effect)

local function chain(creature)
	local creatures = Game.getSpectators(creature:getPosition(), false, false, 4, 4, 4, 4)
	local totalChain = 0
	local targets = {}
	local meleeTargets = {}
	for _, creature in pairs(creatures) do
		if creature:isPlayer() or creature:getMaster() then
				table.insert(meleeTargets, creature)
		end
	end
 
	local counter = 1
	local tempSize = #targets
	if tempSize < 5 and #meleeTargets > 0 then
		for i = tempSize, 5 do
			if meleeTargets[counter] ~= nil then
				table.insert(targets, meleeTargets[counter])
				counter = counter + 1
			end
		end
	end
 
	local lastChain = creature
	local lastChainPosition = creature:getPosition()
	local closestMonster, closestMonsterIndex, closestMonsterPosition
	local path, tempPosition, updateLastChain
	while (totalChain < 5 and #targets > 0) do
		closestMonster = nil
		for index, monster in pairs(targets) do
			tempPosition = monster:getPosition()
			if not closestMonster or getDiagonalDistance(lastChain:getPosition(), tempPosition) < getDiagonalDistance(lastChain:getPosition(), closestMonsterPosition) then
				closestMonster = monster
				closestMonsterIndex = index
				closestMonsterPosition = tempPosition
			end
		end
		table.remove(targets, closestMonsterIndex)
		updateLastChain = false
		if lastChainPosition:getDistance(closestMonsterPosition) == 1 then
			updateLastChain = true
		else
			path = lastChainPosition:getPathTo(closestMonsterPosition, 0, 1, true, true, 9)
			if path and #path > 0 then
				for i=1, #path do
					lastChainPosition:getNextPosition(path[i], 1)
					lastChainPosition:sendMagicEffect(effect)
				end
				updateLastChain = true
			end
		end
		if updateLastChain then
			doTargetCombatHealth(0, closestMonster, COMBAT_FIREDAMAGE, -minDmg, -maxDmg, CONST_ME_NONE)
			closestMonsterPosition:sendMagicEffect(effect)
			lastChain = closestMonster
			lastChainPosition = closestMonsterPosition
			totalChain = totalChain + 1
		end
		lastChain = closestMonster
	end
	return totalChain
end


function onCastSpell(creature, variant)
	local target = creature:getTarget()
	if target then
		local total = chain(target)
		doTargetCombatHealth(0, target, COMBAT_FIREDAMAGE, -minDmg, -maxDmg, CONST_ME_NONE)
		if total > 0 then
			 return true
		else
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end
	else
		return false
	end
end
