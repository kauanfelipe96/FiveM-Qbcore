-- local QBCore = exports['qb-core']:GetCoreObject()
local wantToShowPassport = false
local showingPassport = false

local function showPassport(data)
  lib.hideTextUI()

  local info = {
    citizenid = data.citizenid,
    firstname = data.firstname,
    lastname = data.lastname,
    birthdate = data.birthdate,
    gender = data.gender,
    nationality = data.nationality,
    city = data.city,
    color = data.color
  }

  SendNuiMessage(json.encode({
    action = "passport:setVisible",
    data = true
  }))

  SetNuiFocus(true, true)

  SendNuiMessage(
    json.encode({
      action = "rp_passport:setPassportData",
      data = info
    })
  )

  showingPassport = true
end

local function hidePassport()
  SendNuiMessage(
    json.encode({
      action = "rp_passport:setPassportData",
      data = nil
    })
  )

  SendNuiMessage(json.encode({
    action = "passport:setVisible",
    data = false
  }))

  SetNuiFocus(false, false)
  showingPassport = false
  lib.hideTextUI()
end

RegisterNuiCallback("hidePassport", function()
  hidePassport()
end)

RegisterNetEvent('rp_passport:showItem', function(metadata)
  if wantToShowPassport or showingPassport then return end

  lib.showTextUI(string.format('Gostaria de ver o passaporte de %s?\n\n[Y] - Sim   [N] - Não', metadata.firstname), {
    icon = 'id-card'
  })

  wantToShowPassport = true

  CreateThread(function()
    local timeOut = GetGameTimer() + 5000

    while wantToShowPassport or not showingPassport do
      if IsControlJustReleased(2, 246) then
        wantToShowPassport = false
        showPassport(metadata)
        break
      elseif IsControlJustReleased(2, 306) then
        wantToShowPassport = false
        hidePassport()
        break
      end

      if GetGameTimer() > timeOut then
        wantToShowPassport = false
        hidePassport()
        break
      end

      Wait(0)
    end

    exports.scully_emotemenu:cancelEmote()
  end)
end)


-----------------------------------------------
------------- ITEMS EXPORTS -------------------
-----------------------------------------------
exports("driver_license", function(data, slot)
  exports.scully_emotemenu:playEmoteByCommand('showpass')
  TriggerServerEvent("useItem:driver_license", slot)
end)

exports("id_card", function(data, slot)
  exports.scully_emotemenu:playEmoteByCommand('showpass')
  TriggerServerEvent("useItem:id_card", slot)
end)


exports("id_card_cayo_perico", function(data, slot)
  exports.scully_emotemenu:playEmoteByCommand('showpass')
  TriggerServerEvent("useItem:id_card_cayo_perico", slot)
end)

exports("id_sandy_shores", function(data, slot)
  exports.scully_emotemenu:playEmoteByCommand('showpass')
  TriggerServerEvent("useItem:id_sandy_shores", slot)
end)
