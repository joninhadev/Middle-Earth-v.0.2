local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)

-- Crie uma tabela para rastrear quando a barreira foi usada em cada posição
local barrierCooldowns = {}

function onCreateMagicWall(creature, tile)
    local positionKey = tile.x * 10000 + tile.y * 100 + tile.z
    local currentTime = os.time()

    if barrierCooldowns[positionKey] and currentTime < barrierCooldowns[positionKey] then
        local remainingTime = barrierCooldowns[positionKey] - currentTime
        return false
    end

    local item = Game.createItem(ITEM_MAGICWALL, 1, tile)
    item:setAttribute(ITEM_ATTRIBUTE_DURATION, 20000)

    barrierCooldowns[positionKey] = currentTime + 20000 -- 20 segundos de duração

    addEvent(function()
        barrierCooldowns[positionKey] = currentTime + 20000 + 100 -- 20 segundos de duração + 0.7 segundos de cooldown
        -- Permite que o item 1947 seja criado novamente na mesma posição após 0.7 segundos
        addEvent(function()
            barrierCooldowns[positionKey] = 0
        end, 50)
    end, 20050) -- Agende o cooldown de 0.7 segundos após 20 segundos
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onCreateMagicWall")

local spell = Spell("rune")
function spell.onCastSpell(creature, variant, isHotkey)
    return combat:execute(creature, variant)
end

spell:name("Magic Wall Rune")
spell:group("attack")
spell:id(86)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(32)
spell:magicLevel(9)
spell:runeId(2293)
spell:charges(3)
spell:isBlocking(true, true)
spell:allowFarUse(true)
spell:register()
