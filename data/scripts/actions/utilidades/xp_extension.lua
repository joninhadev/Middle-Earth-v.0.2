local elixirXp = Action()

local sElixir = 9992

function elixirXp.onUse(player, item)

    local storageValue = player:getStorageValue(sElixir)
    local currentTime = os.time()

    if storageValue < 0 or currentTime >= storageValue then
        player:setStorageValue(sElixir, currentTime + 60 * 60)  -- 60 minutos em segundos
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Sua experiência aumentará em 10% durante 60 minutos.")
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
        item:remove(1)
    else
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Você precisa aguardar o efeito do elixir expirar para poder usá-lo novamente.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end

    return true
end

elixirXp:id(42121)
elixirXp:register()