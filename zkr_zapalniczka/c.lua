ESX = nil

function progbar()
	exports['zkr_progbar']:startUI(2900, "Podpalanie...") -- export na progbar
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function loadAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Citizen.Wait(100)
	end
end

RegisterNetEvent('zkr_zapalniczka:zapalniczkastart')
AddEventHandler('zkr_zapalniczka:zapalniczkastart', function()
    local pedalek = GetPlayerPed(-1)
    local kordziki = GetEntityCoords(pedalek)
    local cwel = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@'
    local nigger = 'machinic_loop_mechandplayer'
    loadAnimDict(cwel)
    TaskPlayAnim(pedalek, cwel, nigger, 3.5, -8.0, -1, 1, 0.0, false, false, false)
	progbar()
    Wait(3000)
    ClearPedTasksImmediately(pedalek)
    Wait(1000)
    StartScriptFire(
		kordziki.x, 
		kordziki.y, 
		kordziki.z - 1, 
		25, 
		false
	)
    Wait(15000)
    StopFireInRange(
	kordziki.x, 
	kordziki.y, 
	kordziki.z - 1, 
	0.0000000001 --[[ number ]]
    )
end)


-- by zikor