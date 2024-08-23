local QBCore = exports['qb-core']:GetCoreObject()

local ValidExtensions = {
    [".png"] = true,
    [".gif"] = true,
    [".jpg"] = true,
    ["jpeg"] = true
}

local ValidExtensionsText = '.png, .gif, .jpg, .jpeg'

QBCore.Functions.CreateUseableItem("printerdocument", function(source, item)
    TriggerClientEvent('qb-printer:client:UseDocument', source, item)
end)

QBCore.Functions.CreateUseableItem("official_document", function(source, item)
    TriggerClientEvent('qb-printer:client:UseDocument', source, item)
end)

QBCore.Commands.Add("spawnprinter", Lang:t('command.spawn_printer'), {}, true, function(source, _)
    TriggerClientEvent('qb-printer:client:SpawnPrinter', source)
end, "admin")

RegisterNetEvent('qb-printer:server:SaveDocument', function(url, filename, IsJornal)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    local extension = string.sub(url, -4)
    local validexts = ValidExtensions

    if url ~= nil then
        if validexts[extension] then
            info.url = url
            info.filename = "filename" -- Include the filename in the item metadata
            info.label = "Impressão"
            info.description = filename
            if IsJornal == true then
                Player.Functions.AddItem('printerdocument', 10, nil, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['printerdocument'], "add")
            elseif IsJornal == false then
                Player.Functions.AddItem('official_document', 1, nil, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['official_document'], "add")
            end
        else
            TriggerClientEvent('Core:Notify', src,
                Lang:t('error.invalid_ext') .. ValidExtensionsText .. Lang:t('error.allowed_ext'), "error")
        end
    end
end)

RegisterNetEvent('qb-printer:server:mandado', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('mandado', 1)
end)
