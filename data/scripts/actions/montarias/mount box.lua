local mountBox = Action()

function mountBox.onUse(player, item)

local randomMount = math.random(120)

	if player:hasMount(randomMount) then
	   player:getPosition():sendMagicEffect(CONST_ME_POFF)
	   player:sendTextMessage(19, "Essa montaria voc� j� tem, clique novamente na box.")
	else
	   player:addMount(randomMount)
	   player:getPosition():sendMagicEffect(244)
	   player:sendTextMessage(19, "Voc� recebeu uma montaria aleat�ria, parab�ns!")
	   doRemoveItem(item.uid, 1)
	end
end

mountBox:id(57443)
mountBox:register()

	

	