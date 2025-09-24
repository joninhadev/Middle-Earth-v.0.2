
local shit = {
	{boss = "Laracna", pos = {x=980, y=866, z=12}},
	{boss = "Son of Ancalagon", pos = {x=955, y=369, z=8}},
	{boss = "Son of Ancalagon", pos = {x=1651, y=615, z=12}},
	{boss = "Wormageddon", pos = {x=331, y=390, z=8}},
	{boss = "Olog-hai", pos = {x=1664, y=1141, z=8}},
	{boss = "Olog-hai", pos = {x=507, y=835, z=10}},
	{boss = "Scatha", pos = {x=1394, y=210, z=9}},
	{boss = "Valaraukar", pos = {x=554, y=295, z=1}},
	{boss = "Valaraukar", pos = {x=332, y=508, z=4}},
	{boss = "Jormungand", pos = {x=616, y=518, z=9}},
    {boss = "Eddie", pos = {x=1636, y=458, z=11}},
	{boss = "Scatha", pos = {x=1104, y=1183, z=0}},
	{boss = "Azaka", pos = {x=537, y=196, z=6}},
	{boss = "Smaug", pos = {x=1400, y=376, z=2}},
	{boss = "Wormageddon", pos = {x=274, y=832, z=9}},
    {boss = "Ferumbras", pos = {x=1865, y=811, z=0}},
	{boss = "Adramelech", pos = {x=1659, y=517, z=11}},
	{boss = "Ancalagon", pos = {x=1630, y=851, z=14}},
	{boss = "The Necromancer", pos = {x=557, y=315, z=0}},
	{boss = "Baalrog", pos = {x=553, y=761, z=9}},
	{boss = "Emelianenko", pos = {x=1206, y=766, z=11}},
	{boss = "Khel Thuzad", pos = {x=1788, y=453, z=15}},
	{boss = "Ungoliant", pos = {x=1790, y=374, z=6}},
	{boss = "Saruman", pos = {x=959, y=983, z=1}},
    {boss = "Cerberus", pos = {x=1779, y=355, z=12}},
	{boss = "Melkors Summon", pos = {x=1540, y=94, z=13}},
	{boss = "Avari Leader", pos = {x=978, y=1341, z=8}},
	{boss = "Azazel", pos = {x=374, y=182, z=9}},
	{boss = "The Necromancer", pos = {x=337, y=706, z=1}},
	{boss = "Melkors Summon", pos = {x=309, y=846, z=9}},
	{boss = "Lord of The Elements", pos = {x=127, y=818, z=13}},
	{boss = "Deathstrike", pos = {x=1431, y=484, z=9}},
	{boss = "Obujos", pos = {x=651, y=1153, z=13}},
    {boss = "Jaul", pos = {x=775, y=1162, z=13}},
    {boss = "Evancing", pos = {x=777, y=1514, z=12}},
	{boss = "Zamulosh", pos = {x=1848, y=352, z=13}}
}

function onThink(cid, interval)
    local nomonster = {}
    for _, v in pairs(shit) do
        if not getCreatureName(v.boss) then
            table.insert(nomonster, _)
        end
    end
    if #nomonster == 0 then return true end

    local r = nomonster[math.random(1, #nomonster)]
    local uid = doSummonCreature(shit[r].boss, shit[r].pos)
    local monster = Creature(uid) -- pega o objeto creature

    if monster then
        if monster:getType():isRewardBoss() then
            monster:setReward(true)
        end
        print("[BOSS SYSTEM] Spawned: " .. shit[r].boss)
    end
    return true
end

