local RefineSystem = require("data/lib/Refinement_System_Lib")

local config = {
    refinement = {
        anvilId = RefineSystem.ANVIL_ID,
        hammerId = RefineSystem.config.Hammer,
        messages = {
            mustUseAnvil = RefineSystem.config.messages.mustUseAnvil
        },
        effects = {
            poff = RefineSystem.config.effectPoff,
            fail = RefineSystem.config.effectFail
        }
    },
    room = {
        area = {
            fromPos = {x = 1120, y = 976, z = 7},
            toPos = {x = 1129, y = 986, z = 7}
        },
        actionIds = {
            enter = 4502,
            exit = 4504,
            refine = 4500,
            block = 4503
        },
        messages = {
            enter = "Bem-vindo à sala de refino, %s!",
            leave = "Você saiu da sala de refino.",
            refineArea = "Você chegou à área de refino. Você pode começar a refinar seus itens.",
            refineOccupied = "A área de refino está ocupada por %s. Tente novamente mais tarde.",
            refineLeft = "Você deixou a área de refino.",
            refineFree = "A área de refino está livre. Você pode utilizá-la!"
        }
    }
}

local refinementAction = Action()
function refinementAction.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if not target or target:getId() ~= config.refinement.anvilId then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, config.refinement.messages.mustUseAnvil)
        player:getPosition():sendMagicEffect(config.refinement.effects.poff)
        return true
    end

    if not RefineSystem.refineItem(player, RefineSystem.REFINE_POSITIONS) then
        player:getPosition():sendMagicEffect(config.refinement.effects.fail)
    end

    return true
end
refinementAction:id(config.refinement.hammerId)
refinementAction:register()

local RefiningRoomManager = {
    playerInRefineArea = nil,
    playersInRoom = {}
}

function RefiningRoomManager:isPositionInRoom(position)
    local fromPos = config.room.area.fromPos
    local toPos = config.room.area.toPos
    return position.x >= fromPos.x and position.x <= toPos.x and
           position.y >= fromPos.y and position.y <= toPos.y and
           position.z == fromPos.z
end

function RefiningRoomManager:isRefineAreaOccupied()
    return self.playerInRefineArea ~= nil
end
function RefiningRoomManager:setPlayerInRefineArea(player)
    self.playerInRefineArea = player:getId()
end
function RefiningRoomManager:clearRefineArea()
    self.playerInRefineArea = nil
end
function RefiningRoomManager:addPlayerToRoom(player)
    self.playersInRoom[player:getId()] = true
end
function RefiningRoomManager:removePlayerFromRoom(player)
    self.playersInRoom[player:getId()] = nil
end
function RefiningRoomManager:isPlayerInRoom(player)
    return self.playersInRoom[player:getId()] == true
end

local roomEnterEvent = MoveEvent()
function roomEnterEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if not RefiningRoomManager:isPlayerInRoom(player) then
        RefiningRoomManager:addPlayerToRoom(player)

        local message = string.format(config.room.messages.enter, player:getName())
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, message)

        if RefiningRoomManager:isRefineAreaOccupied() then
            local refiner = Player(RefiningRoomManager.playerInRefineArea)
            if refiner then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, string.format(config.room.messages.refineOccupied, refiner:getName()))
            end
        else
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, config.room.messages.refineFree)
        end
    end

    return true
end
roomEnterEvent:type("stepin")
roomEnterEvent:aid(config.room.actionIds.enter)
roomEnterEvent:register()

local roomExitEvent = MoveEvent()
function roomExitEvent.onStepOut(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if RefiningRoomManager:isPlayerInRoom(player) then
        RefiningRoomManager:removePlayerFromRoom(player)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, config.room.messages.leave)
    end

    return true
end
roomExitEvent:type("stepout")
roomExitEvent:aid(config.room.actionIds.exit)
roomExitEvent:register()

local refineAreaEnterEvent = MoveEvent()
function refineAreaEnterEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if RefiningRoomManager:isRefineAreaOccupied() and RefiningRoomManager.playerInRefineArea ~= player:getId() then
        local refiner = Player(RefiningRoomManager.playerInRefineArea)
        if refiner then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format(config.room.messages.refineOccupied, refiner:getName()))
        end
        player:teleportTo(fromPosition, true)
        return false
    end

    RefiningRoomManager:setPlayerInRefineArea(player)
    player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, config.room.messages.refineArea)
    return true
end
refineAreaEnterEvent:type("stepin")
refineAreaEnterEvent:aid(config.room.actionIds.refine)
refineAreaEnterEvent:register()

local refineAreaExitEvent = MoveEvent()
function refineAreaExitEvent.onStepOut(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if RefiningRoomManager.playerInRefineArea == player:getId() then
        RefiningRoomManager:clearRefineArea()
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, config.room.messages.refineLeft)
    end

    return true
end
refineAreaExitEvent:type("stepout")
refineAreaExitEvent:aid(config.room.actionIds.refine)
refineAreaExitEvent:register()

local blockDoorEvent = MoveEvent()
function blockDoorEvent.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if RefiningRoomManager:isRefineAreaOccupied() then
        local refiner = Player(RefiningRoomManager.playerInRefineArea)
        if refiner then
            player:sendTextMessage(MESSAGE_STATUS_WARNING, string.format(config.room.messages.refineOccupied, refiner:getName()))
        else
            player:sendTextMessage(MESSAGE_STATUS_WARNING, "A área de refino está ocupada. Tente novamente mais tarde.")
        end

        player:teleportTo(fromPosition, true)
        return false
    end

    return true
end
blockDoorEvent:type("stepin")
blockDoorEvent:aid(config.room.actionIds.block)
blockDoorEvent:register()

-- Event callback para mostrar atributos elementais na descrição do item
local ec = EventCallback
ec.onLook = function(self, thing, position, distance, description)
    local baseDescription = description
    baseDescription = baseDescription:gsub("%.$", "")
    
    if baseDescription:find("%(Arm:") then
        local elementalAttributes = {}
        local absorbAttributes = {}
        local hasElementals = false
        
        -- Verificar atributos elementais ofensivos da source
        local offensiveElementTypes = {
            {attr = ITEM_ATTRIBUTE_ELEMENTICE, name = "Ice"},
            {attr = ITEM_ATTRIBUTE_ELEMENTEARTH, name = "Earth"},
            {attr = ITEM_ATTRIBUTE_ELEMENTFIRE, name = "Fire"},
            {attr = ITEM_ATTRIBUTE_ELEMENTENERGY, name = "Energy"},
            {attr = ITEM_ATTRIBUTE_ELEMENTDEATH, name = "Death"},
            {attr = ITEM_ATTRIBUTE_ELEMENTHOLY, name = "Holy"}
        }
        
        for _, element in ipairs(offensiveElementTypes) do
            if thing:hasAttribute(element.attr) then
                local value = thing:getAttribute(element.attr)
                if value and value > 0 then
                    table.insert(elementalAttributes, element.name .. " +" .. value .. " damage")
                    hasElementals = true
                end
            end
        end
        
        -- Verificar atributos elementais defensivos (absorção) da source
        local defensiveElementTypes = {
            {attr = ITEM_ATTRIBUTE_ABSORBICE, name = "Ice"},
            {attr = ITEM_ATTRIBUTE_ABSORBEARTH, name = "Earth"},
            {attr = ITEM_ATTRIBUTE_ABSORBFIRE, name = "Fire"},
            {attr = ITEM_ATTRIBUTE_ABSORBENERGY, name = "Energy"},
            {attr = ITEM_ATTRIBUTE_ABSORBDEATH, name = "Death"},
            {attr = ITEM_ATTRIBUTE_ABSORBHOLY, name = "Holy"}
        }
        
        for _, element in ipairs(defensiveElementTypes) do
            if thing:hasAttribute(element.attr) then
                local value = thing:getAttribute(element.attr)
                if value and value > 0 then
                    table.insert(absorbAttributes, element.name .. " +" .. value .. "%% resist")
                    hasElementals = true
                end
            end
        end
        
        if hasElementals then
            local armorPattern = "%(Arm:(%d+)%)"
            local armor = baseDescription:match(armorPattern)
            
            if armor then
                local allAttributes = {}
                
                -- Adicionar atributos ofensivos
                for _, attr in ipairs(elementalAttributes) do
                    table.insert(allAttributes, attr)
                end
                
                -- Adicionar atributos defensivos
                for _, attr in ipairs(absorbAttributes) do
                    table.insert(allAttributes, attr)
                end
                
                if #allAttributes > 0 then
                    description = baseDescription:gsub(armorPattern, 
                        string.format("(Arm:%s, %s)", 
                        armor, 
                        table.concat(allAttributes, ", ")))
                end
            end
        end
    end
    
    return description .. "."
end
ec:register(66)