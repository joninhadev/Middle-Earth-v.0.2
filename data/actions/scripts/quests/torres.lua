-- Torres
-- Alavancas aberta 9825 fechada 9826

function onUse(cid, item, frompos, item2, topos)
	
	if item.uid == 6001 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6002)
			doRemoveItem(6003)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end
		
	elseif item.uid == 6004 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6005)
			doRemoveItem(6006)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end

	elseif item.uid == 6007 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6008)
			doRemoveItem(6009)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end
		
	elseif item.uid == 6010 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6011)
			doRemoveItem(6012)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end
		
	elseif item.uid == 6013 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6014)
			doRemoveItem(6015)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end
		
	elseif item.uid == 6016 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6017)
			doRemoveItem(6018)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end
		
	elseif item.uid == 6019 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6020)
			doRemoveItem(6021)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end
	
	elseif item.uid == 6022 then
		if item.itemid == 9825 then
			doTransformItem(item.uid,item.itemid+1)
			doRemoveItem(6023)
		elseif item.itemid == 9826 then
			doPlayerSendCancel(cid,"Ela está emperrada.")
		end
		
	end

	return true
end
