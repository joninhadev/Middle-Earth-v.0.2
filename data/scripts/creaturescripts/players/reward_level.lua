local rewardLevel = CreatureEvent('rewardLevel')

function rewardLevel.onAdvance(cid, skill, oldlevel, newlevel)

	       	if getPlayerLevel(cid) >= 25 and getPlayerStorageValue(cid, 99963) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 20000)
						    setPlayerStorageValue(cid, 99963, 1)
						    doPlayerSendTextMessage(cid, 19, "Você recebeu 2 crystal coins por atingir o level 25, parabéns!")

		    elseif getPlayerLevel(cid) >= 50 and getPlayerStorageValue(cid, 99964) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 30000)
						    setPlayerStorageValue(cid, 99964, 1)
						    doPlayerSendTextMessage(cid, 19, "Você recebeu 3 crystal coins por atingir o level 50, parabéns!")

		   elseif getPlayerLevel(cid) >= 75 and getPlayerStorageValue(cid, 99965) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 50000)
						    setPlayerStorageValue(cid, 99965, 1)
						    doPlayerSendTextMessage(cid, 19, "Você recebeu 5 crystal coins por atingir o level 75, parabéns!")

		     elseif getPlayerLevel(cid) >= 101 and getPlayerStorageValue(cid, 99966) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 70000)
						    setPlayerStorageValue(cid, 99966, 1)
						    doPlayerSendTextMessage(cid, 19, "Você recebeu 7 crystal coins por atingir o level 101, parabéns!")


			elseif getPlayerLevel(cid) >= 150 and getPlayerStorageValue(cid, 99969) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 100000)
						    setPlayerStorageValue(cid, 99969, 1)
						   doPlayerSendTextMessage(cid, 19, "Você recebeu 10 crystal coins por atingir o level 150, parabéns!")





						    end
		    return true
end

rewardLevel:register()
