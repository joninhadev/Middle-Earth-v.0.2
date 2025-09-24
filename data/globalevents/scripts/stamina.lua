function onThink(interval)
for _, cid in pairs(Game.getPlayers()) do
Player(cid):setStamina(Player(cid):getStamina()+1)
end
return true
end