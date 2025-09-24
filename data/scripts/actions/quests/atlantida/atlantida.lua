local atlantida = Action()

function atlantida.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local pedestais = {
        {pos = Position(385, 1121, 12), itemId = 9786},
        {pos = Position(695, 1127, 12), itemId = 9787},
        {pos = Position(734, 1156, 12), itemId = 9784}
    }

    -- Verifica se o item usado é o correto (10029)
    if item.itemid ~= 10029 then
        player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce precisa usar a ferramenta correta.")
        return true
    end

    -- Verifica cada pedestal
    for _, pedestal in ipairs(pedestais) do
        local tileItem = Tile(pedestal.pos):getItemById(pedestal.itemId)
        
        if tileItem then
            -- Remove o pedestal e transforma o item
            tileItem:remove()
            item:transform(item.itemid + 1)
            player:sendTextMessage(MESSAGE_INFO_DESCR, "Voce removeu um pedestal!")
            return true
        end
    end

    player:sendTextMessage(MESSAGE_INFO_DESCR, "Nenhum pedestal encontrado nesta posicao.")
    return true
end

atlantida:aid(6877)
atlantida:aid(6878)
atlantida:aid(6879)
atlantida:register()