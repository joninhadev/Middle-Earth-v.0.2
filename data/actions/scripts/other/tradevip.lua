function onUse(cid, item, fromPosition, itemEx, toPosition)
    doPlayerAddPremiumDays(cid, 1)
    doPlayerSendTextMessage(cid, 22, "Você recebeu 1 Dia de VIP.")
    doRemoveItem(item.uid,1)
	return TRUE
    end 
	