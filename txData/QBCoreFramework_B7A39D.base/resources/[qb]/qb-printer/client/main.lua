local QBCore = exports['qb-core']:GetCoreObject()
local newsreading = false
local printerzone = nil
local InsidePrinterzone = false
local entranceTargetID = 'entranceTarget'
local carryPackage = nil
local packageCoords = nil
local onDuty = false
local PlayerJob
local newspaper

local isjornal = true

AddEventHandler('onResourceStart', function(resourceName)
  if resourceName == GetCurrentResourceName() then
    QBCore.Functions.GetPlayerData(function(PlayerData)
      PlayerJob = PlayerData.job
    end)
  end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  QBCore.Functions.GetPlayerData(function(PlayerData)
    PlayerJob = PlayerData.job
  end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
  PlayerJob = JobInfo
end)

RegisterCommand('Printer', function(_)
  TriggerEvent('qb-printer:printer')
end)


--[[RegisterNetEvent('qb-printer:client:SpawnPrinter', function()
  local playerPed = PlayerPedId()
  local coords    = GetEntityCoords(playerPed)
  local forward   = GetEntityForwardVector(playerPed)
  local x, y, z   = table.unpack(coords + forward * 1.0)

  local model     = `prop_printer_02`
  RequestModel(model)
  while (not HasModelLoaded(model)) do
    Wait(1)
  end


  local obj = CreateObject(model, x, y, z, true, false, true)

exports['ox_target']:addLocalEntity(obj,
    {
      {
        name = "qb-printer-printer",
        event = 'qb-printer:printer',
        icon = "fas fa-print",
        label = 'Usar impressora',
        distance = 2.0
      },

    })

  PlaceObjectOnGroundProperly(obj)
  SetModelAsNoLongerNeeded(model)
  SetEntityAsMissionEntity(obj)
end)]]
print('teste')
local coords_news = vector4(-600.56, -935.41, 23.86, 0.54)
exports['qb-target']:AddBoxZone("news_printer", coords_news, 1, 1, {
  name = "news_printer",
  heading = 0,
  debugpoly = true,
}, {
  options = {
    {
      icon = "fas fa-print",
      label = "Usar impressora",
      action = function()
        isjornal = true
        TriggerEvent('qb-printer:printer')
      end
    },
  },
  distance = 1.5
})

local coords_jud = vector4(235.1, -1095.23, 29.32, 270.24)
exports['qb-target']:AddBoxZone("jud_printer", coords_jud, 1, 1, {
  name = "jud_printer",
  heading = 0,
  debugpoly = false,
}, {
  options = {
    {
      icon = "fas fa-print",
      label = "Usar impressora",
      action = function()
        isjornal = false
        TriggerEvent('qb-printer:printer')
      end
    },
    {
      icon = "fa-solid fa-gavel",
      label = "Emitir mandado",
      action = function()
        TriggerServerEvent('qb-printer:server:mandado')
      end
    },
  },
  distance = 1.5
})

-- NUI

RegisterNUICallback('SaveDocument', function(data, cb)
  if data.url then
    TriggerServerEvent('qb-printer:server:SaveDocument', data.url, data.filename, isjornal)
  end
  cb('ok')
end)

RegisterNUICallback('CloseDocument', function(_, cb)
  SetNuiFocus(false, false)
  cb('ok')
  ---anim close
  exports.scully_emotemenu:cancelEmote()
  DetachEntity(newspaper, true, true)
  DeleteObject(newspaper)
  newspaper = nil
  newsreading = false
end)

RegisterNetEvent('qb-printer:printer', function()
  SendNUIMessage({
    action = "start"
  })
  FreezePedCameraRotation(PlayerPedId())
  SetNuiFocus(true, true)
end)


exports('official_document', function(data, slot)
  exports.ox_inventory:useItem(data, function(data)
    if data then
      local DocumentUrl = data.metadata.url

      SendNUIMessage({
        action = "open",
        url = DocumentUrl
      })

      ExecuteCommand(('e clipboard %s'):format(variant))


      SetNuiFocus(true, false)
    end
  end)
end)


RegisterNetEvent('qb-printer:client:UseDocument', function(ItemData)
  local DocumentUrl = ItemData.metadata.url ~= nil and ItemData.metadata.url or false
  SendNUIMessage({
    action = "open",
    url = DocumentUrl
  })

  ExecuteCommand(('e newspaper2 %s'):format(variant))
  -- RequestAnimDict('missfam4')
  -- while (not HasAnimDictLoaded('missfam4')) do
  --   Wait(7)
  -- end

  -- RequestModel('prop_cliff_paper')
  -- while not HasModelLoaded('prop_cliff_paper') do
  --   Wait(0)
  -- end

  -- newspaper = CreateObject(GetHashKey("prop_cliff_paper"), 0, 0, 0, true, true, true)

  -- TaskPlayAnim(PlayerPedId(), "missfam4", "base", 3.0, 2.0, -1, 17, 0.0, false, false, false)
  -- AttachEntityToEntity(newspaper, PlayerPedId(), GetPedBoneIndex(GetPlayerPed(-1), 18905), 0.26, 0.06, 0.16, 320.0, 310.0,
  --   0.0, true, true, false, true, 1, true)
  -- newsreading = true

  SetNuiFocus(true, false)
end)





-------- target abaixo -----
--[[local function RegisterEntranceTarget()
  local coords = vector3(Config.Location.x, Config.Location.y, Config.Location.z)


  printerzone = BoxZone:Create(coords, 1, 4, {
    name = entranceTargetID,
    heading = 44.0,
    minZ = Config.Location.z - 1.0,
    maxZ = Config.Location.z + 2.0,
    debugPoly = false
  })

  printerzone:onPlayerInOut(function(isPointInside)
    if isPointInside then
      exports['core']:DrawText('[E] Usar Ploter', 'left')
    else
      exports['core']:HideText()
    end

    InsidePrinterzone = isPointInside
  end)
end


CreateThread(function()
  local sleep = 500

  while not LocalPlayer.state.isLoggedIn do
    -- do nothing
    Wait(sleep)
  end

  RegisterEntranceTarget()

  while true do
    sleep = 500

    if InsidePrinterzone then
      sleep = 0
      if IsControlJustReleased(0, 38) then
        exports['core']:KeyPressed()
        Wait(500)
        TriggerEvent('qb-printer:printer')
        exports['core']:HideText()
      end
    end
    Wait(sleep)
  end
end)
]]
--[[exports["ox_target"]:addBoxZone({
  name = 'qb-printer-zone',
  coords = vector3(-570.43, -919.53, 23.87),
  rotation = 182.68,
  size = vector3(1.2, 1.2, 1.2),
  options = { {
    name = "qb-printer",
    event = "qb-printer:printer",
    icon = "fas fa-print",
    label = "Usar impressora",
    distance = 2.0,
  } }
})]]
