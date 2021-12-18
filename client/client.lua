Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(2000)
        local ped = PlayerPedId()
            
        spawnPoint = config.spawnPoint[math.random(1, #config.spawnPoint)].vector
        if GetDistanceBetweenCoords(spawnPoint, GetEntityCoords(ped)) > config.maxDistance then
            local model = GetEntityModel(ped)
            local hashInfo = FoundObjects[model]

            if hashInfo and model == GetHashKey(config.defaultPed) then
                SetEntityCoords(ped, spawnPoint)
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"Spawn", config.spawnBackMessage}
                })
            end
        end
    end
end)
