function onUse(cid, item, fromPosition, itemEx, toPosition)
	
if getPlayerLevel(cid) <= 49 then			 
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE,"Apenas level 50 tem essa habilidade!")
			return TRUE
		end	

doCreateItem(2677, 8, fromPosition)
	
doTransformItem(item.uid, 2786)


	doDecayItem(item.uid)
	
return true
end
