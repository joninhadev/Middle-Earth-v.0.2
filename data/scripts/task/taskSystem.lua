-- credits: Mateus Roberto - modified with 3 daily limits per monster type and 24h wait time or reset purchase option.

dofile('data/lib/core/json.lua')
dofile('data/scripts/task/taskSystemTables.lua')

taskPointStorage = 5151
playerPointsStorage = 5152
uniqueTaskId = 5155
currentKillStorage = 23345

for _, task in ipairs(configTasks) do
    task.killStorage = currentKillStorage
    currentKillStorage = currentKillStorage + 1
end

TaskSystem = {
    list = {},
    baseStorage = 1955,
    maximumTasks = 1,
    countForParty = true,
    maxDist = 7,
    players = {},
    dailyTaskLimit = 3, 
    TASKS_PER_PAGE = 12,
    
    checkTaskTypeLimit = function(player, taskId)
        local task = nil
        
        for _, t in ipairs(TaskSystem.list) do
            if t.id == taskId then
                task = t
                break
            end
        end
        
        if not task then
            return { completed = 0, canComplete = true }
        end
        
        local completedToday = player:getStorageValue(task.limitStorage)
        if completedToday == -1 then
            completedToday = 0
            player:setStorageValue(task.limitStorage, 0)
        end
        
        local lastTaskTime = player:getStorageValue(task.timeStorage)
        local currentTime = os.time()
        
        if lastTaskTime > 0 and (currentTime - lastTaskTime) >= 86400 then
            player:setStorageValue(task.limitStorage, 0)
            completedToday = 0
        end
        
        return {
            completed = completedToday,
            canComplete = completedToday < TaskSystem.dailyTaskLimit,
            lastCompletionTime = lastTaskTime
        }
    end,
    
    loadDatabase = function()
        if (#TaskSystem.list > 0) then
            return true
        end

        local monsters = Game.getMonsters()

        function getMonsterLooktypeByName(monsterName)
            for _, monster in ipairs(monsters) do
                if monster:getName():lower() == monsterName:lower() then
                    return monster:getOutfit().lookType
                end
            end

            return nil
        end

        function initializeTasksAndPoints()
            for i = 1, #configTasks do
                table.insert(TaskSystem.list, {
                    id = i,
                    name = configTasks[i].nameOfTheTask,
                    mobsToKill = configTasks[i].mobsToKill,
                    looktype = configTasks[i].looktype,
                    kills = configTasks[i].killsRequired,
                    taskPoints = configTasks[i].pointsReward,
                    exp = configTasks[i].expReward,
                    realitem = configTasks[i].itemRewards,
                    count = configTasks[i].itemRewardsCount,
                    limit = configTasks[i].limit,
                    limitAtual = 0,
                    points = 0,
                    limitStorage = configTasks[i].limitStorage, 
                    timeStorage = configTasks[i].timeStorage,
                    resetCost = configTasks[i].resetCost or 0
                })
            end

            for _, player in ipairs(Game.getPlayers()) do
                local playerPoints = player:getStorageValue(playerPointsStorage)
                for _, task in ipairs(TaskSystem.list) do
                    if task.id == player:getStorageValue(playerCurrentTaskStorage) then
                        if player:getStorageValue(playerCurrentTaskStorage) == -1 or player:getStorageValue(playerCurrentTaskStorage) == nil then
                            player:setStorageValue(playerCurrentTaskStorage, 0)
                        end
                        task.points = playerPoints
                        break
                    end
                end
            end
            print("Initialization complete.")
        end

        initializeTasksAndPoints()
        return true
    end,
    
    getCurrentTasks = function(player)
        local tasks = {}

        for _, task in ipairs(TaskSystem.list) do
            if (player:getStorageValue(TaskSystem.baseStorage + task.id) > 0) then
                local playerTask = task
                playerTask.left = player:getStorageValue(TaskSystem.baseStorage + task.id)
                playerTask.done = playerTask.kills - (playerTask.left - 1)
                
                -- Garantir que done não seja maior que kills
                if playerTask.done > playerTask.kills then
                    playerTask.done = playerTask.kills
                end
                
                local taskLimitInfo = TaskSystem.checkTaskTypeLimit(player, task.id)
                playerTask.dailyCompleted = taskLimitInfo.completed
                playerTask.canCompleteToday = taskLimitInfo.canComplete
                
                table.insert(tasks, playerTask)
            end
        end

        return tasks
    end,
    
    getPlayerTaskIds = function(player)
        local tasks = {}

        for _, task in ipairs(TaskSystem.list) do
            if (player:getStorageValue(TaskSystem.baseStorage + task.id) > 0) then
                table.insert(tasks, task.id)
            end
        end

        return tasks
    end,
    
    onAction = function(player, data)
        if (data['action'] == 'info') then
            local page = data['page'] or 1
            TaskSystem.sendData(player, page)
            TaskSystem.players[player.uid] = 1
        elseif (data['action'] == 'hide') then
            TaskSystem.players[player.uid] = nil
        elseif (data['action'] == 'start') then
            local playerTaskIds = TaskSystem.getPlayerTaskIds(player)

            if (#playerTaskIds == TaskSystem.maximumTasks) then
                return player:sendExtendedJSONOpcode(215, {
                    message = "You can't take more tasks.",
                    color = 'red'
                })
            end

            for _, task in ipairs(TaskSystem.list) do
                if (task.id == data['entry']) then
                    if (table.contains(playerTaskIds, task.id)) then
                        return player:sendExtendedJSONOpcode(215, {
                            message = 'You already have this task active.',
                            color = 'red'
                        })
                    end
                    
                    local taskLimitInfo = TaskSystem.checkTaskTypeLimit(player, task.id)
                    if not taskLimitInfo.canComplete then
                        local lastTaskTime = taskLimitInfo.lastCompletionTime
                        local timeLeft = 86400 - (os.time() - lastTaskTime)
                        local hoursLeft = math.floor(timeLeft / 3600)
                        local minutesLeft = math.floor((timeLeft % 3600) / 60)
                        
                        local message = string.format([[
== LIMITE DE TASK DIÁRIO ATINGIDO ==

Você já completou o limite diário de %d tasks de '%s'.

Tempo restante: %d horas e %d minutos.

Espere o tempo restante ou use o botão Reset para resetar a task.
]], TaskSystem.dailyTaskLimit, task.name, hoursLeft, minutesLeft, task.id)
                        
                        player:popupFYI(message)
                        
                        return player:sendExtendedJSONOpcode(215, {
                            message = "Limite diário atingido.",
                            color = 'red'
                        })
                    end

                    player:setStorageValue(TaskSystem.baseStorage + task.id, task.kills + 1)
                    player:sendExtendedJSONOpcode(215, {
                        message = 'Task Inicializada.',
                        color = 'green'
                    })

                    return TaskSystem.sendData(player, data['page'] or 1)
                end
            end

            return player:sendExtendedJSONOpcode(215, {
                message = 'Unknown task.',
                color = 'red'
            })
        elseif (data['action'] == 'cancel') then
            for _, task in ipairs(TaskSystem.list) do
                if (task.id == data['entry']) then
                    local playerTaskIds = TaskSystem.getPlayerTaskIds(player)

                    if (not table.contains(playerTaskIds, task.id)) then
                        return player:sendExtendedJSONOpcode(215, {
                            message = "Você não tem task ativa.",
                            color = 'red'
                        })
                    end

                    player:setStorageValue(TaskSystem.baseStorage + task.id, -1)
                    player:sendExtendedJSONOpcode(215, {
                        message = 'Task cancelada.',
                        color = 'green'
                    })

                    return TaskSystem.sendData(player, data['page'] or 1)
                end
            end

            return player:sendExtendedJSONOpcode(215, {
                message = 'Unknown task.',
                color = 'red'
            })
        elseif (data['action'] == 'finish') then
            for _, task in ipairs(TaskSystem.list) do
                if (task.id == data['entry']) then
                    local playerTaskIds = TaskSystem.getPlayerTaskIds(player)

                    if (not table.contains(playerTaskIds, task.id)) then
                        return player:sendExtendedJSONOpcode(215, {
                            message = "You don't have this task active.",
                            color = 'red'
                        })
                    end

                    local left = player:getStorageValue(TaskSystem.baseStorage + task.id)

                    if (left > 1) then
                        return player:sendExtendedJSONOpcode(215, {
                            message = "Task isn't completed yet.",
                            color = 'red'
                        })
                    end
                    
                    local taskLimitInfo = TaskSystem.checkTaskTypeLimit(player, task.id)
                    if not taskLimitInfo.canComplete then
                        local lastTaskTime = taskLimitInfo.lastCompletionTime
                        local timeLeft = 86400 - (os.time() - lastTaskTime)
                        local hoursLeft = math.floor(timeLeft / 3600)
                        local minutesLeft = math.floor((timeLeft % 3600) / 60)
                        
                        local message = string.format([[
== DAILY TASK LIMIT REACHED ==

You have already completed the daily limit of %d tasks for '%s'.

Time remaining: %d hours and %d minutes.

Use the Reset button to purchase a reset.
]], TaskSystem.dailyTaskLimit, task.name, hoursLeft, minutesLeft, task.id)
                        
                        player:popupFYI(message)
                        
                        return player:sendExtendedJSONOpcode(215, {
                            message = "Daily task limit reached.",
                            color = 'red'
                        })
                    end

                    player:setStorageValue(task.limitStorage, taskLimitInfo.completed + 1)
                    player:setStorageValue(task.timeStorage, os.time())
                    
                    player:setStorageValue(TaskSystem.baseStorage + task.id, -1)
                    player:addExperience(task.exp)
                    player:addItem(task.realitem, task.count)

                    player:setStorageValue(playerPointsStorage, player:getStorageValue(playerPointsStorage) + task.taskPoints)
                    player:setStorageValue(taskPointStorage, (player:getStorageValue(taskPointStorage) + task.taskPoints))
                    
                    local tasksLeft = TaskSystem.dailyTaskLimit - (taskLimitInfo.completed + 1)
                    
                    if tasksLeft > 0 then
                        local message = string.format([[
== TASK COMPLETEA COM SUCESSO! ==

Parabéns, você completou a task: %s

Você ainda pode completar %d tarefas dessa hoje.
]], task.name, tasksLeft)
                        player:popupFYI(message)
                    else
                        local timeLeft = 86400
                        local hoursLeft = math.floor(timeLeft / 3600)
                        local minutesLeft = math.floor((timeLeft % 3600) / 60)
                        
                        local message = string.format([[
== TASK COMPLETEA COM SUCESSO! ==

Parabéns, você completou a task: %s

Você atingiu o máximo de tasks desse tipo hoje.
Tempo até a reinicialização: %d horas e %d minutos.

Use o botão Reset para comprar o reset e faze-la novamente!
]], task.name, hoursLeft, minutesLeft, task.id)
                        player:popupFYI(message)
                    end
                    
                    player:sendExtendedJSONOpcode(215, {
                        message = "Task completed successfully.",
                        color = 'green'
                    })
                    return TaskSystem.sendData(player, data['page'] or 1)
                end
            end

            return player:sendExtendedJSONOpcode(215, {
                message = 'Unknown task.',
                color = 'red'
            })
        elseif (data['action'] == 'reset') then
            local taskId = data['entry']
            local playerTaskIds = TaskSystem.getPlayerTaskIds(player)
            
            if table.contains(playerTaskIds, taskId) then
                return player:sendExtendedJSONOpcode(215, {
                    message = "You cannot reset a task that is currently active. Cancel it first.",
                    color = 'red'
                })
            end

            local task = nil
            for _, t in ipairs(TaskSystem.list) do
                if t.id == taskId then
                    task = t
                    break
                end
            end
            
            if not task then
                return player:sendExtendedJSONOpcode(215, {
                    message = "Task not found.",
                    color = 'red'
                })
            end
            
            local taskLimitInfo = TaskSystem.checkTaskTypeLimit(player, taskId)
            if taskLimitInfo.completed < TaskSystem.dailyTaskLimit then
                return player:sendExtendedJSONOpcode(215, {
                    message = "You haven't reached the daily limit for this task yet.",
                    color = 'red'
                })
            end
            
            local crystalCoinId = 2160
            local cost = task.resetCost or 0
            
            if cost <= 0 then
                return player:sendExtendedJSONOpcode(215, {
                    message = "This task does not have a reset cost configured.",
                    color = 'red'
                })
            end
            
            if player:getItemCount(crystalCoinId) < cost then
                return player:sendExtendedJSONOpcode(215, {
                    message = string.format("You need %d crystal coin(s) to reset this task.", cost),
                    color = 'red'
                })
            end
            
            -- Enviar confirmação com custo para o cliente
            return player:sendExtendedJSONOpcode(215, {
                action = 'confirm_reset',
                taskId = taskId,
                taskName = task.name,
                cost = cost,
                page = data['page'] or 1
            })
            
        elseif (data['action'] == 'confirm_reset_yes') then
            local taskId = data['entry']
            local playerTaskIds = TaskSystem.getPlayerTaskIds(player)
            
            if table.contains(playerTaskIds, taskId) then
                return player:sendExtendedJSONOpcode(215, {
                    message = "You cannot reset a task that is currently active. Cancel it first.",
                    color = 'red'
                })
            end

            local task = nil
            for _, t in ipairs(TaskSystem.list) do
                if t.id == taskId then
                    task = t
                    break
                end
            end
            
            if not task then
                return player:sendExtendedJSONOpcode(215, {
                    message = "Task not found.",
                    color = 'red'
                })
            end
            
            local taskLimitInfo = TaskSystem.checkTaskTypeLimit(player, taskId)
            if taskLimitInfo.completed < TaskSystem.dailyTaskLimit then
                return player:sendExtendedJSONOpcode(215, {
                    message = "You haven't reached the daily limit for this task yet.",
                    color = 'red'
                })
            end
            
            local crystalCoinId = 2160
            local cost = task.resetCost or 0
            
            if cost <= 0 then
                return player:sendExtendedJSONOpcode(215, {
                    message = "This task does not have a reset cost configured.",
                    color = 'red'
                })
            end
            
            if player:getItemCount(crystalCoinId) < cost then
                return player:sendExtendedJSONOpcode(215, {
                    message = string.format("You need %d crystal coin(s) to reset this task.", cost),
                    color = 'red'
                })
            end
            
            if not player:removeItem(crystalCoinId, cost) then
                return player:sendExtendedJSONOpcode(215, {
                    message = "Error removing crystal coins.",
                    color = 'red'
                })
            end
            
            -- Reset the task limit
            player:setStorageValue(task.limitStorage, 0)
            
            player:sendExtendedJSONOpcode(215, {
                message = string.format("Task '%s' reset successfully! Cost: %d crystal coin(s)", task.name, cost),
                color = 'green'
            })
            
            return TaskSystem.sendData(player, data['page'] or 1)
        end
    end,
    
    killForPlayer = function(player, task)
        local left = player:getStorageValue(TaskSystem.baseStorage + task.id)

        if (left <= 1) then
            if (TaskSystem.players[player.uid]) then
                player:sendExtendedJSONOpcode(215, {
                    message = 'Task finished.',
                    color = 'green'
                })
            end
            return true
        end

        player:setStorageValue(TaskSystem.baseStorage + task.id, left - 1)
        if (TaskSystem.players[player.uid]) then
            return TaskSystem.sendData(player, 1)
        end
    end,

    onKill = function(player, target)
        local targetName = target:getName():lower()

        for _, task in ipairs(TaskSystem.list) do
            for _, mob in ipairs(task.mobsToKill) do
                if mob:lower() == targetName then
                    local playerTaskIds = TaskSystem.getPlayerTaskIds(player)

                    if (not table.contains(playerTaskIds, task.id)) then
                        return true
                    end

                    local party = player:getParty()
                    local tpos = target:getPosition()

                    if (TaskSystem.countForParty and party and party:getMembers()) then
                        for _, creature in pairs(party:getMembers()) do
                            local pos = creature:getPosition()

                            if (pos.z == tpos.z and pos:getDistance(tpos) <= TaskSystem.maxDist) then
                                TaskSystem.killForPlayer(creature, task)
                                local currentCount = task.kills - (creature:getStorageValue(TaskSystem.baseStorage + task.id) - 1)
                                local taskCount = task.kills
                                creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Defeated: [" .. currentCount .. "/" .. taskCount .. "] monsters for the task: " .. task.name .. ".")
                                if currentCount >= taskCount then
                                    creature:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Parabéns! Você completou a task: " .. task.name .. ", recolha a recompensa no menu de tasks..")
                                    creature:getPosition():sendMagicEffect(326)
                                end
                            end
                        end

                        local pos = party:getLeader():getPosition()

                        if (pos.z == tpos.z and pos:getDistance(tpos) <= TaskSystem.maxDist) then
                            TaskSystem.killForPlayer(party:getLeader(), task)
                            local currentCount = task.kills - (party:getLeader():getStorageValue(TaskSystem.baseStorage + task.id) - 1)
                            local taskCount = task.kills
                            party:getLeader():sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Defeated: [" .. currentCount .. "/" .. taskCount .. "] monsters for the task: " .. task.name .. ".")
                            if currentCount >= taskCount then
                                party:getLeader():sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Parabéns! Você completou a task: " .. task.name .. ", recolha a recompensa no menu de tasks..")
                                party:getLeader():getPosition():sendMagicEffect(326)
                            end
                        end
                    else
                        TaskSystem.killForPlayer(player, task)
                        local currentCount = task.kills - (player:getStorageValue(TaskSystem.baseStorage + task.id) - 1)
                        local taskCount = task.kills
                        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Defeated: [" .. currentCount .. "/" .. taskCount .. "] monsters for the task: " .. task.name .. ".")
                        if currentCount >= taskCount then
                            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "[Task System] Parabéns! Você completou a task: " .. task.name .. ", click on 'tasks' to claim your reward.")
                            player:getPosition():sendMagicEffect(326)
                        end
                    end

                    return true
                end
            end
        end
    end,
    
    sendData = function(player, page)
        page = page or 1
        local playerTasks = TaskSystem.getCurrentTasks(player)
        
        local taskLimits = {}
        for _, task in ipairs(TaskSystem.list) do
            local limitInfo = TaskSystem.checkTaskTypeLimit(player, task.id)
            taskLimits[task.id] = {
                completed = limitInfo.completed,
                canComplete = limitInfo.canComplete,
                lastCompletionTime = limitInfo.lastCompletionTime
            }
        end
        
        local totalTasks = #TaskSystem.list
        local totalPages = math.ceil(totalTasks / TaskSystem.TASKS_PER_PAGE)
        local startIndex = (page - 1) * TaskSystem.TASKS_PER_PAGE + 1
        local endIndex = math.min(startIndex + TaskSystem.TASKS_PER_PAGE - 1, totalTasks)
        
        local paginatedTasks = {}
        for i = startIndex, endIndex do
            table.insert(paginatedTasks, TaskSystem.list[i])
        end
        
        local response = {
            pointsGeneral = player:getStorageValue(playerPointsStorage),
            allTasks = paginatedTasks,
            playerTasks = playerTasks,
            taskLimits = taskLimits,
            dailyTaskLimit = TaskSystem.dailyTaskLimit,
            pagination = {
                currentPage = page,
                totalPages = totalPages,
                totalTasks = totalTasks,
                tasksPerPage = TaskSystem.TASKS_PER_PAGE
            }
        }
        player:sendExtendedJSONOpcode(215, response)
    end
}

local events = {}

local globalevent = GlobalEvent('Tasks')

function globalevent.onStartup()
    return TaskSystem.loadDatabase()
end

table.insert(events, globalevent)

local creatureevent = CreatureEvent('TaskKill')

function creatureevent.onKill(creature, target)
    if (not creature:isPlayer() or not Monster(target)) then
        return true
    end

    TaskSystem.onKill(creature, target)

    return true
end

table.insert(events, creatureevent)

for _, event in ipairs(events) do
    event:register()
end

local talkaction = TalkAction("!resetTask")

function talkaction.onSay(player, words, param)
    local taskId = tonumber(param)
    
    if not taskId then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Please use the reset button in the task window or use !resetTask [task ID]")
        return false
    end
    
    local task = nil
    for _, t in ipairs(TaskSystem.list) do
        if t.id == taskId then
            task = t
            break
        end
    end
    
    if not task then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Task not found. Use a valid ID.")
        return false
    end
    
    local taskLimitInfo = TaskSystem.checkTaskTypeLimit(player, taskId)
    if taskLimitInfo.completed < TaskSystem.dailyTaskLimit then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You haven't reached the daily limit for this task yet.")
        return false
    end
    
    local crystalCoinId = 2160
    local cost = task.resetCost or 0
    
    if cost <= 0 then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "This task does not have a reset cost configured.")
        return false
    end
    
    if player:getItemCount(crystalCoinId) < cost then
        player:popupFYI(string.format(
            "You don't have enough crystal coins to reset the task.\n\nCost: %d crystal coin(s).",
            cost
        ))
        return false
    end
    
    if not player:removeItem(crystalCoinId, cost) then
        player:popupFYI("An error occurred while trying to remove crystal coins.")
        return false
    end
    
    player:setStorageValue(task.limitStorage, 0)
    
    local message = string.format([[ 
== TASK RESET ==

The daily limit for '%s' has been successfully reset!

You can now start this task again.

Cost: %d crystal coin(s)
]], task.nameOfTheTask or task.name, cost)

    player:popupFYI(message)
    
    TaskSystem.sendData(player, 1)
    
    return true
end

talkaction:separator(" ")
talkaction:register()