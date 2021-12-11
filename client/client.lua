Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(2000)
        if GetDistanceBetweenCoords(config.spawn_point, GetEntityCoords(GetPlayerPed(-1))) > config.max_distance then
            local hash = GetEntityModel(PlayerPedId())
            local getdefault = GetHashKey(config.default_ped)
            local check = false
            for k,v in pairs(FoundObjects) do
                if v.HashIs == hash  and v.HashIs == getdefault then
                    check = true
                    break
                end 
            end

            if(check == true) then
                SetEntityCoords(PlayerPedId(),config.spawn_point)
                TriggerEvent('chatMessage', config.spawn_back_message)
            end
        end
    end
end)