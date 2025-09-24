function onThink(interval, lastExecution)

	local pos = {x=0,y=0,z=0}
	local n = 1
	local tps = 0
	local destino = {x=1591, y=365, z=6}
	local nego
	local npc = 0
	local dice = 1
	
	pos[1]={x=1594,y=366,z=4}
	pos[2]={x=1596,y=366,z=4}
	pos[3]={x=1598,y=366,z=4}
	pos[4]={x=1600,y=366,z=4}
	pos[5]={x=1602,y=366,z=4}
	pos[6]={x=1604,y=366,z=4}
	
	pos[7]={x=1594,y=375,z=4}
	pos[8]={x=1596,y=375,z=4}
	pos[9]={x=1598,y=375,z=4}
	pos[10]={x=1600,y=375,z=4}
	pos[11]={x=1602,y=375,z=4}
	pos[12]={x=1604,y=375,z=4}
	
	pos[13]={x=1302,y=1352,z=3}
	pos[14]={x=1302,y=1354,z=3}
	pos[15]={x=1302,y=1356,z=3}
	pos[16]={x=1302,y=1358,z=3}
	pos[17]={x=1302,y=1360,z=3}
	pos[18]={x=1302,y=1362,z=3}
	
	pos[19]={x=1317,y=1352,z=3}
	pos[20]={x=1317,y=1354,z=3}
	pos[21]={x=1317,y=1356,z=3}
	pos[22]={x=1317,y=1358,z=3}
	pos[23]={x=1317,y=1360,z=3}
	pos[24]={x=1317,y=1362,z=3}
	
	while n < 25 do
		
		dice = math.random(5)
		
		if n < 13 then
			if dice == 1 then
				destino = {x=1591, y=365, z=6}
			elseif dice == 2 then
				destino = {x=1608, y=376, z=6}
			elseif dice == 3 then
				destino = {x=1600, y=365, z=6}
			elseif dice == 4 then
				destino = {x=1600, y=376, z=6}
			else
				destino = {x=1591, y=376, z=6}
			end
		else
			if dice == 1 then
				destino = {x=1305, y=1358, z=2}
			elseif dice == 2 then
				destino = {x=1303, y=1359, z=2}
			elseif dice == 3 then
				destino = {x=1306, y=1359, z=2}
			elseif dice == 4 then
				destino = {x=1309, y=1358, z=2}
			else
				destino = {x=1312, y=1359, z=2}
			end
		end
		
		 local areapos = {x=pos[n].x, y=pos[n].y, z=pos[n].z, stackpos=253}
		nego = getTopCreature(areapos).uid
		
		local yy
		
		if n < 7 then
			yy = pos[n].y - 1;
		else
			yy = pos[n].y + 1;
		end
			
		if isPlayer(nego) then
			doTeleportThing(nego,destino)
			tps = tps + 1
		end
		
		n = n+1
	end
	return TRUE
end