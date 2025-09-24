function onSay(cid, words, param)
    local velocidade = getCreatureSpeed(cid) / 2
    local saldo = getPlayerBalance(cid)
    local vip = getPlayerPremiumDays(cid)

    local pvp = (cid:getStorageValue(87221) >= 1) and "NO-PVP" or "PVP"

    local blesslvl = (getPlayerBlessing(cid, 2) and getPlayerBlessing(cid, 3) 
                      and getPlayerBlessing(cid, 4) and getPlayerBlessing(cid, 5)) 
                      and "1.49%" or "3.50%"

    local blessskill = "0.35%"
    local blessml = "0.35%"
    
    local item = getPlayerSlotItem(cid, 2).itemid
    local isSpecialItem = (item == 2173) or (getPlayerLevel(cid) <= 50)
    
    local looti = isSpecialItem or blesslvl == "1.49%" and "0.00%" or "5.00%"
    local lootb = isSpecialItem and "0.00%" or "100.00%"

    -- Verificação das ilhas
    local islands = {
        Vortex = 35710,
        Venom = 35708,
        Snow = 35706,
        Divine = 35711,
        Darkness = 35709,
        Burning = 35707,
        Adventurer = 35705,
    }

    local islandStatus = ""
    for name, storage in pairs(islands) do
        if getPlayerStorageValue(cid, storage) >= 1 then
            islandStatus = islandStatus .. string.format("%-12s: Ativo\n", name)
        end
    end

    -- Se não houver ilhas desbloqueadas
    if islandStatus == "" then
        islandStatus = "Nenhuma ilha desbloqueada."
    end

    -- Formatação da mensagem
    local result = string.format([[
        **Status do Jogador**

        **Velocidade:** %s de velocidade
        **Dinheiro no Banco:** %s gold coins
        **Conta Premium:** %s dia(s) de vip
        **Status PVP:** %s
        **Perda de Experiência ao Morrer:** %s
        **Perda de Magic Level ao Morrer:** %s
        **Perda de Skill ao Morrer:** %s
        **Chance de Perder Itens:** %s

        **Acesso das Ilhas:**
		
        %s
    ]], velocidade, saldo, vip, pvp, blesslvl, blessml, blessskill, looti, islandStatus)

    doPlayerPopupFYI(cid, result)
    return false
end