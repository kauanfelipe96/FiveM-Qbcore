local showCompass = false  -- Inicialmente desativado
local isLoopRunning = false
local lastHeading = nil

function loop()
    while showCompass do
        if Config.compass.followGameplayCam then
            local camRot = GetGameplayCamRot(0)
            heading = tostring(round(360.0 - ((camRot.z + 360.0) % 360.0)))
        else
            heading = tostring(round(360.0 - GetEntityHeading(PlayerPedId())))
        end
        if heading == '360' then heading = '0' end
        if heading ~= lastHeading then
            SendNUIMessage({ action = "display", value = heading })
            Citizen.Wait(2)
        end
        lastHeading = heading
    end
    isLoopRunning = false
end

RegisterNetEvent('compass:show')
AddEventHandler('compass:show', function()
    if not isLoopRunning then
        showCompass = true
        isLoopRunning = true
        Citizen.CreateThread(function()
            loop()
        end)
        SetNuiFocus(true, true)
    end
end)

RegisterNetEvent('compass:hide')
AddEventHandler('compass:hide', function()
    showCompass = false
    SendNUIMessage({ action = "hide" })
    SetNuiFocus(false, false)
end)

RegisterCommand('showcompass', function()
    TriggerEvent('compass:show')
    TriggerEvent('chat:addMessage', {
        color = { 0, 0, 255 },
        multiline = true,
        args = { "Compass", "Compass ON" }
    })
end, false)

RegisterCommand('hidecompass', function()
    TriggerEvent('compass:hide')
    TriggerEvent('chat:addMessage', {
        color = { 0, 0, 255 },
        multiline = true,
        args = { "Compass", "Compass OFF" }
    })
end, false)
