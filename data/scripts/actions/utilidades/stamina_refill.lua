local refillStamina = Action()

local fullStamina = 42*60

function refillStamina.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    if (player:getCondition(CONDITION_INFIGHT, CONDITION_DEFAULT) or player:isPzLocked())
    and not (Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)) then 
        player:sendCancelMessage("VocÍ n„o pode refilar sua stamina enquanto estiver com battle.")
        return true
    end
    if player:getStamina() >= fullStamina then 
        player:sendCancelMessage("Sua stamina estù· cheia.")
    elseif player:getStorageValue(STAMINA_REFIL_TIME) > os.time() then
        player:sendCancelMessage("VocÍ precisa aguardar 24 horas para refillar sua stamina.")
    else
        player:setStamina(fullStamina)
        player:say("VocÍ refilou com sucesso sua stamina atù 42:00 horas.", TALKTYPE_MONSTER_SAY)
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_GREEN)
        player:setStorageValue(STAMINA_REFILL_TIME, os.time() + 24 * 60 * 60)
        item:remove(1)
    end
    return true
end

refillStamina:id(42119)
refillStamina:register()