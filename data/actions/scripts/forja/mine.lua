function onUse(cid, item, frompos, item2, topos)

	local voc = getPlayerVocation(cid)

	if voc == 17 or voc == 18 or voc == 19 or voc == 20 or voc == 21 or voc == 22 then
		
		if item2.itemid == 5619 or item2.itemid == 5620 then
			local level = getPlayerLevel(cid)
			local rand = math.random(level+50)
			
			if (rand > 60) then
				doPlayerSendTextMessage(cid,22,'Voce achou minerio de ferro!')
				doSendMagicEffect(topos,4)
				doPlayerAddItem(cid,5880,1)
				if math.random(20) == 15 then
					doTransformItem(item2.uid,item2.itemid+2)
					doDecayItem(item2.uid)
				end
			else
				doSendMagicEffect(topos,10)
			end
			
		elseif item2.itemid == 5621 or item2.itemid == 5622 then
			doPlayerSendTextMessage(cid,18,'Esta mina esta vazia!')
			
		end
	else
		doPlayerSendTextMessage(cid,18,'Voce precisa ser um minerador ou ferreiro para extrair metais.')
		return 0
	end

return 1
end
