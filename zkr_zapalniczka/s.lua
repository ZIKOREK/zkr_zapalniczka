ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local itemek = 'zapalniczka'   -- tu se wpisujesz nazwe zapaliniczki

ESX.RegisterUsableItem(itemek, function(source)
    TriggerClientEvent('zkr_zapalniczka:zapalniczkastart', source)
end)