-- local Core = exports['qb-core']:GetCoreObject()

RegisterNetEvent("useItem:driver_license", function(item)
    local PlayerPed = GetPlayerPed(source)
    local PlayerCoords = GetEntityCoords(PlayerPed)

    local nearbyPlayers = lib.getNearbyPlayers(PlayerCoords, 3.0, true)

    local ids = {}

    for _, v in ipairs(nearbyPlayers) do
        ids[#ids + 1] = v.id
    end

    item.metadata.city = "Ribeirão Pires"
    item.metadata.color = "blue"

    lib.triggerClientEvent('rp_passport:showItem', ids, item.metadata)
end)

exports("id_card", function(item)
    local PlayerPed = GetPlayerPed(source)
    local PlayerCoords = GetEntityCoords(PlayerPed)

    local nearbyPlayers = lib.getNearbyPlayers(PlayerCoords, 3.0, true)

    local ids = {}

    for _, v in ipairs(nearbyPlayers) do
        ids[#ids + 1] = v.id
    end

    item.metadata.city = "Ribeirão Pires"
    item.metadata.color = "blue"

    lib.triggerClientEvent('rp_passport:showItem', ids, item.metadata)
end)

RegisterNetEvent("useItem:id_card_cayo_perico", function(item)
    local PlayerPed = GetPlayerPed(source)
    local PlayerCoords = GetEntityCoords(PlayerPed)

    local nearbyPlayers = lib.getNearbyPlayers(PlayerCoords, 3.0, true)

    local ids = {}

    for _, v in ipairs(nearbyPlayers) do
        ids[#ids + 1] = v.id
    end


    item.metadata.city = "Cayo Perico"
    item.metadata.color = "green"

    lib.triggerClientEvent('rp_passport:showItem', ids, item.metadata)
end)

RegisterNetEvent("useItem:id_sandy_shores", function(item)
    local PlayerPed = GetPlayerPed(source)
    local PlayerCoords = GetEntityCoords(PlayerPed)

    local nearbyPlayers = lib.getNearbyPlayers(PlayerCoords, 3.0, true)

    local ids = {}

    for _, v in ipairs(nearbyPlayers) do
        ids[#ids + 1] = v.id
    end

    item.metadata.city = "Sandy Shores"
    item.metadata.color = "beige"

    lib.triggerClientEvent('rp_passport:showItem', ids, item.metadata)
end)
