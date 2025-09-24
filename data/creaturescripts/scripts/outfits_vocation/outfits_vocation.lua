--[[ By Vodkart ]]-- 
local config = {
    {
        outfit = {136,128,137,129,138,130,139,131,140,132,141,133,142,134,147,143,149,145,150,146,
                  155,151,156,152,157,153,158,154,252,251,269,268,270,273,279,278,288,289,324,325,
                  336,335,366,367,431,430,433,432,464,463,465,466},
        voc = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16},
        storage = 40851 -- OUTIFITS DE HUMANOS
    },
    {
        outfit = {1892, 1893, 1894, 1895, 1896, 1897, 1898, 1899, 1900, 1901},
        voc = {21, 22, 23, 24, 25, 26},
        storage = 40853 -- OUTIFITS DE ORC GUERREIROS
    },
    {
        outfit = {144, 148, 1905, 1904, 1902, 1903},
        voc = {35, 36, 37, 38, 39},
        storage = 40852 -- OUTFITS DE ELFOS ARQUEIROS
    },
    {
        outfit = {1876, 1881, 1883, 1888, 1889, 1890, 1891},
        voc = {17, 18, 19, 20},
        storage = 40854 -- OUTFITS DE DWARFS
    }
}
     
    function onLogin(cid)  
     
    for a =1,#config do  
    if isInArray(config[a].voc, getPlayerVocation(cid)) and getPlayerStorageValue(cid, config[a].storage) == -1 then  
    setPlayerStorageValue(cid, config[a].storage, 1)  
    for i = 1, #config[a].outfit do 
    doPlayerAddOutfit(cid, config[a].outfit[i], 0)   
    end   
    break  
    end  
    end  
    return true  
    end