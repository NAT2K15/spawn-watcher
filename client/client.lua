Citizen.CreateThread(function() 
    while true do
        Citizen.Wait(2000)
        local ped = PlayerPedId()

        if GetDistanceBetweenCoords(config.spawnPoint, GetEntityCoords(ped)) > config.maxDistance then
            local model = GetEntityModel(ped)
            local hashInfo = FoundObjects[model]

            if hashInfo and model == GetHashKey(config.defaultPed) then
                SetEntityCoords(ped, config.spawnPoint)
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"Spawn", config.spawnBackMessage}
                })
            end
        end
    end
end)
