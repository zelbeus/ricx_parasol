data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("RegisterUsableItem:parasol")
AddEventHandler("RegisterUsableItem:parasol", function(source)
    TriggerClientEvent('ricx_parasol:start', source)
end)
