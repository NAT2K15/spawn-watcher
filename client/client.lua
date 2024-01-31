CreateThread(function() 
    while true do
        Wait(2000)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local closestSpawnPoint = GetClosestSpawnPoint(coords)
        if #(closestSpawnPoint - coords) > config.maxDistance then
            local model = GetEntityModel(ped)
            if model == config.defaultPed then
                SetEntityCoords(ped, closestSpawnPoint)
                TriggerEvent('chat:addMessage', {
                    color = {255, 0, 0},
                    args = {"Spawn", config.spawnBackMessage}
                })
            end
        end
    end
end)

function GetClosestSpawnPoint(coords)
    local closestSpawnPoint = config.spawnPoints[1]
    local closestDistance = #(coords - closestSpawnPoint)

    for _, spawnPoint in ipairs(config.spawnPoints) do
        local distance = #(coords - spawnPoint)
        if distance < closestDistance then
            closestSpawnPoint = spawnPoint
            closestDistance = distance
        end
    end

    return closestSpawnPoint
end