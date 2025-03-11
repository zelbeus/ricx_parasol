local VorpCore = {}
local VorpInv
local data = {}

local Parasols = {
    {item = "parasol", model = GetHashKey("p_parasol02x")},
    --{item = "parasol2", model = GetHashKey("new_parasol_item_object_name")},
}

if Config.vorp then
    Citizen.CreateThread(function()
        Wait(500)
        TriggerEvent("getCore",function(core)
            VorpCore = core
        end)
        VorpInv = exports.vorp_inventory:vorp_inventoryApi()
        if Parasols then 
            for i,v in pairs(Parasols) do 
                VorpInv.RegisterUsableItem(v.item, function(vdata)
                    TriggerClientEvent("vorp:TipRight", vdata.source, "You're using parasol", 5000)
                    TriggerClientEvent('ricx_parasol:start',vdata.source, v.model)
                end)
            end
        else
            VorpInv.RegisterUsableItem("parasol", function(vdata)
                TriggerClientEvent("vorp:TipRight", vdata.source, "You're using parasol", 5000)
                TriggerClientEvent('ricx_parasol:start',vdata.source)
            end)
        end
    end)


          
elseif Config.redm then

    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
    if Parasols then 
        for i,v in pairs(Parasols) do 
            RegisterServerEvent("RegisterUsableItem:"..v, function(source)
                TriggerClientEvent('ricx_parasol:start', source, v.model)
            end)
        end
    else
        RegisterServerEvent("RegisterUsableItem:parasol")
        AddEventHandler("RegisterUsableItem:parasol", function(source)
            TriggerClientEvent('ricx_parasol:start', source)
        end)
    end
end   
