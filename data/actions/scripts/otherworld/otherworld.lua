function onUse(cid, item, frompos, item2, topos)
	if item.uid == 48484 then
		if item.itemid == 9825 then

			player1pos = {x=2031, y=484, z=15, stackpos=253}
			player1 = getTopCreature(player1pos)

			player2pos = {x=2031, y=485, z=15, stackpos=253}
			player2 = getTopCreature(player2pos)

			player3pos = {x=2031, y=486, z=15, stackpos=253}
			player3 = getTopCreature(player3pos)

			player4pos = {x=2031, y=487, z=15, stackpos=253}
			player4 = getTopCreature(player4pos)
			
			player5pos = {x=2031, y=488, z=15, stackpos=253}
			player5 = getTopCreature(player5pos)


			if player1.itemid > 0 and player2.itemid > 0 and player3.itemid > 0 and player4.itemid > 0 and player5.itemid > 0 then

				local player1level = getPlayerLevel(player1.uid)
				local player2level = getPlayerLevel(player2.uid)
				local player3level = getPlayerLevel(player3.uid)
				local player4level = getPlayerLevel(player4.uid)
				local player5level = getPlayerLevel(player5.uid)
				
				local questlevel = 300

				if player1level >= questlevel and player2level >= questlevel and player3level >= questlevel and player4level >= questlevel and player5level >= questlevel then

					
	
						boss1pos = {x=2003, y=481, z=15}
						boss2pos = {x=2059, y=481, z=15}
						boss3pos = {x=2031, y=456, z=15}
						boss4pos = {x=2030, y=425, z=15}

					 
						doSummonCreature("Rupture", boss1pos)
						doSummonCreature("Eradicator", boss2pos)
						doSummonCreature("Aftershock", boss3pos)
						doSummonCreature("World Devourer", boss4pos)


						nplayer1pos = {x=2002, y=492, z=15}
						nplayer2pos = {x=2003, y=492, z=15}
						nplayer3pos = {x=2004, y=492, z=15}
						nplayer4pos = {x=2005, y=492, z=15}
						nplayer5pos = {x=2006, y=492, z=15}

						doSendMagicEffect(player1pos,3)
						doSendMagicEffect(player2pos,3)
						doSendMagicEffect(player3pos,3)
						doSendMagicEffect(player4pos,3)
						doSendMagicEffect(player5pos,3)

						doTeleportThing(player1.uid,nplayer1pos)
						doTeleportThing(player2.uid,nplayer2pos)
						doTeleportThing(player3.uid,nplayer3pos)
						doTeleportThing(player4.uid,nplayer4pos)
						doTeleportThing(player5.uid,nplayer5pos)

						doSendMagicEffect(nplayer1pos,11)
						doSendMagicEffect(nplayer2pos,11)
						doSendMagicEffect(nplayer3pos,11)
						doSendMagicEffect(nplayer4pos,11)
						doSendMagicEffect(nplayer5pos,11)

						doTransformItem(item.uid,item.itemid+1)

						
				else
				doPlayerSendCancel(cid,"Algum dos jogadores não tem level suficiente.")
				end
				
			else
				doPlayerSendCancel(cid,"A equipe precisa ser de 5 jogadores.")
			end
			
		elseif item.itemid == 9825 then
			if getPlayerAccess(cid) >= 4 then
				doTransformItem(item.uid,item.itemid-1)
			else
				doPlayerSendCancel(cid,"Uma equipe já entrou hoje, aguarde até amanhã.")
			end
		end
		




	elseif item.uid == 17596 then
		queststatus = getPlayerStorageValue(cid,50084)
		
		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"Você achou uma crackling egg.")
			doPlayerAddItem(cid,26340,1)
			setPlayerStorageValue(cid,50084,1)
		else
			doPlayerSendTextMessage(cid,22,"Está vazia.")
		end
		return true
		
	elseif item.uid == 17597 then
		queststatus = getPlayerStorageValue(cid,50084)
		
		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"Você achou um vibrant egg.")
			doPlayerAddItem(cid,26194,1)
			setPlayerStorageValue(cid,50084,1)
		else
			doPlayerSendTextMessage(cid,22,"Está vazia.")
		end
		return true
	
	elseif item.uid == 17598 then
		queststatus = getPlayerStorageValue(cid,50084)
		
		if queststatus == -1 then
			doPlayerSendTextMessage(cid,22,"Você achou um menacing egg.")
			doPlayerAddItem(cid,26341,1)
			setPlayerStorageValue(cid,50084,1)
		else
			doPlayerSendTextMessage(cid,22,"Está vazia.")
		end
		end
		

return true


end