local premiumDaysCost = 15

function onSay(player, words, param)
      
	  local test = player:getGuid();
	  
	 if not stile and not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE) then
     player:sendCancelMessage("Você tem que está em uma zona de proteção.")
	 
  return false
  end
	  
	  if not isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) then
		 player:sendCancelMessage("Você não está red skull")
		return false
		end
		

		
		if player:getPremiumDays() < premiumDaysCost then
		 player:sendCancelMessage("Você precisa de " .. premiumDaysCost .." para remover sua redskull.")
		
		return false
		end
	  
	  
	  if isInArray({SKULL_RED, SKULL_BLACK}, player:getSkull()) and player:getPremiumDays() >= premiumDaysCost then
	    player:removePremiumDays(premiumDaysCost)
		player:setSkull(SKULL_NONE)
		player:setSkullTime(0)
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		player:remove()
		db.query("UPDATE `player_deaths` SET `unjustified` = 0 WHERE `unjustified` = 1 AND `killed_by` = " .. db.escapeString(player:getName()))
		db.asyncQuery("DELETE FROM `player_kills` WHERE `player_id` = " ..test)
		return false
		end
		
		


	
	

	
	return false
end 
