ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

atms = {
    {id=1,   x=-2240.83,   y=-611.75,   z=13.88,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=2,   x=166.09,     y=6635.0,    z=31.71,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=3,   x=1562.55,    y=3526.48,   z=36.12,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=4,   x=-386.733,   y=6045.953,  z=31.501,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=5,   x=-284.037,   y=6224.385,  z=31.187,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=6,   x=-284.037,   y=6224.385,  z=31.187,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=7,   x=-135.165,   y=6365.738,  z=31.101,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=8,   x=-112.1287,  y=6469.222,  z=31.6267,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0}, ------------------
    {id=9,   x=-94.9690,   y=6455.301,  z=31.784,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=10,  x=155.4300,   y=6641.991,  z=31.784,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=11,  x=174.6720,   y=6637.218,  z=31.784,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=12,  x=1703.138,   y=6426.783,  z=32.730,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=13,  x=1735.114,   y=6411.035,  z=35.164,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=14,  x=1702.842,   y=4933.593,  z=42.051,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=15,  x=1967.333,   y=3744.293,  z=32.272,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=16,  x=1821.917,   y=3683.483,  z=34.244,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=17,  x=1174.532,   y=2705.278,  z=38.027,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=18,  x=540.0420,   y=2671.007,  z=42.177,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=19,  x=2564.399,   y=2585.100,  z=38.016,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=20,  x=2558.683,   y=349.6010,  z=108.050,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=21,  x=2558.051,   y=389.4817,  z=108.660,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=22,  x=1077.692,   y=-775.796,  z=58.218,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=23,  x=1139.018,   y=-469.886,  z=66.789,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=24,  x=1168.975,   y=-457.241,  z=66.641,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=25,  x=1153.884,   y=-326.540,  z=69.245,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=26,  x=381.2827,   y=323.2518,  z=103.270,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=27,  x=236.4638,   y=217.4718,  z=106.840,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=28,  x=265.0043,   y=212.1717,  z=106.780,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=29,  x=285.2029,   y=143.5690,  z=104.970,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=30,  x=157.7698,   y=233.5450,  z=106.450,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=31,  x=-164.568,   y=233.5066,  z=94.919,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=32,  x=-1827.04,   y=785.5159,  z=138.020,  hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=33,  x=-1409.39,   y=-99.2603,  z=52.473,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=34,  x=-1205.35,   y=-325.579,  z=37.870,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=35,  x=-1213.208,  y=-331.0103, z=37.78702, hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0}, ------------------
    {id=36,  x=-2072.41,   y=-316.959,  z=13.345,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=37,  x=-2975.72,   y=379.7737,  z=14.992,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=38,  x=-2962.60,   y=482.1914,  z=15.762,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0}, ------------------
    {id=39,  x=-2955.70,   y=488.7218,  z=15.486,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=40,  x=-3044.22,   y=595.2429,  z=7.595,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=41,  x=-3144.13,   y=1127.415,  z=20.868,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=42,  x=-3241.10,   y=996.6881,  z=12.500,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=43,  x=-3241.11,   y=1009.152,  z=12.877,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=44,  x=-1305.40,   y=-706.240,  z=25.352,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=45,  x=-538.225,   y=-854.423,  z=29.234,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=46,  x=-711.156,   y=-818.958,  z=23.768,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=47,  x=-717.614,   y=-915.880,  z=19.268,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=48,  x=-526.566,   y=-1222.90,  z=18.434,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=49,  x=-256.831,   y=-719.646,  z=33.444,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=50,  x=-203.548,   y=-861.588,  z=30.205,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=51,  x=112.4102,   y=-776.162,  z=31.427,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=52,  x=112.9290,   y=-818.710,  z=31.386,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=53,  x=119.9000,   y=-883.826,  z=31.191,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=54,  x=149.0414,   y=-1040.501, z=29.37409, hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=55,  x=146.6898,   y=-1035.459, z=29.34409, hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=56,  x=-846.304,   y=-340.402,  z=38.687,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=57,  x=-1204.35,   y=-324.391,  z=37.877,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=58,  x=-1216.27,   y=-331.461,  z=37.773,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=59,  x=-56.1935,   y=-1752.53,  z=29.452,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=60,  x=-261.692,   y=-2012.64,  z=30.121,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=61,  x=-273.001,   y=-2025.60,  z=30.197,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=62,  x=314.187,    y=-278.621,  z=54.170,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0}, ------------------
    {id=63,  x=-351.534,   y=-49.529,   z=49.042,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0}, ------------------
    {id=64,  x=24.589,     y=-946.056,  z=29.357,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=65,  x=-254.112,   y=-692.483,  z=33.616,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=66,  x=-1570.197,  y=-546.651,  z=34.955,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=67,  x=-1415.909,  y=-211.825,  z=46.500,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=68,  x=-1430.112,  y=-211.014,  z=46.500,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=69,  x=33.232,     y=-1347.849, z=29.497,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=70,  x=129.216,    y=-1292.347, z=29.269,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=71,  x=287.645,    y=-1282.646, z=29.659,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=72,  x=289.012,    y=-1256.545, z=29.440,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=73,  x=295.839,    y=-895.640,  z=29.217,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=74,  x=1686.753,   y=4815.809,  z=42.008,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=75,  x=-302.408,   y=-829.945,  z=32.417,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=76,  x=5.134,      y=-919.949,  z=29.557,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=77,  x=527.26,     y=-160.76,   z=57.09,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=78,  x=-867.19,    y=-186.99,   z=37.84,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=79,  x=-821.62,    y=-1081.88,  z=11.13,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=80,  x=-660.71,    y=-854.06,   z=24.48,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=81,  x=-1109.73,   y=-1690.81,  z=4.37,     hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=82,  x=-1091.5,    y=2708.66,   z=18.95,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=83,  x=1175.63,    y=2706.294,  z=38.09402, hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0}, ------------------
    {id=84,  x=2683.09,    y=3286.53,   z=55.24,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=85,  x=89.61,      y=2.37,      z=68.31,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=86,  x=-30.3,      y=-723.76,   z=44.23,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=87,  x=-28.07,     y=-724.61,   z=44.23,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=88,  x=-613.24,    y=-704.84,   z=31.24,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=89,  x=-618.84,    y=-707.9,    z=30.5,     hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=90,  x=-1289.23,   y=-226.77,   z=42.45,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=91,  x=-1285.6,    y=-224.28,   z=42.45,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=92,  x=-1286.24,   y=-213.39,   z=42.45,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=93,  x=-1282.54,   y=-210.45,   z=42.45,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=94,  x=1022.46,    y=-2290.32,  z=30.51,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=95,  x=-1308.81,   y=-823.86,   z=17.15,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=96,  x=-567.82,    y=-199.2,    z=33.42,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=97,  x=-577.1,     y=-194.89,   z=38.22,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=98,  x=-537.24,    y=-171.64,   z=38.22,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=99,  x=-527.97,    y=-166.34,   z=38.22,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=100, x=357.58,     y=-1413.64,  z=32.51,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=101, x=-1074.02,   y=-827.71,   z=19.04,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=102, x=230.97,     y=367.45,    z=106.11,   hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=103, x=-109.04,    y=-1778.25,  z=29.84,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    --
    {id=104, x=-468.46,    y=-990.51,   z=26.27,     hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=105, x=-472.93,    y=-1001.51,  z=30.69,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=106, x=4494.36,    y=-4525.67,  z=4.41,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0},
    {id=107, x=468.35,     y=-990.71,   z=26.27,    hp=100, blip=0, alarm = 0, timeout = 0, alarmtime = 0}
}
bankomatlokacija = nil

RegisterNetEvent('PrikaziNui:banka')
AddEventHandler('PrikaziNui:banka',function()
    SetNuiFocus(true, true)
    TriggerServerEvent('Informacije')
    SendNUIMessage({showUI = true,Ime = tabela.Ime,Novac = tabela.Novac})
end)

function atmDistance()
    local player = PlayerPedId()
    local playerloc = GetEntityCoords(player, 0)
    for _, search in pairs(atms) do
        local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
        if distance <= 2 then
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                return false
            else
                bankomatlokacija = search
                return true
            end
        end
    end
end

tabela = {}
RegisterNetEvent('Reload')
AddEventHandler('Reload',function(ime,novac)
    tabela['Novac'] = novac
    tabela['Ime'] = ime
    SendNUIMessage({Ime = tabela.Ime,Novac = tabela.Novac})
end)

RegisterNUICallback('izlaz',function()
    SetNuiFocus(false, false)  
    SendNUIMessage({showUI = false;})
    PlaySound(-1, "CHARACTER_CHANGE_CHARACTER_01_MASTER", 0, 0, 0, 0);
end)

RegisterNUICallback('PrebaciNovac',function(data)
    TriggerServerEvent('PrebaciNovacServer',data.Novac)
    TriggerServerEvent('Informacije')
end)

RegisterNUICallback('PodigniNovac',function(data)
    TriggerServerEvent('PodigniNovacServer',data.Novac)
    TriggerServerEvent('Informacije')
end)

RegisterNUICallback('PosaljiNovac',function(data)
    TriggerServerEvent('PosaljiNovacServer',data.Novac,data.Igrac)
    TriggerServerEvent('Informacije')
end)

RegisterNUICallback('Greska',function()
    TriggerServerEvent('GreskaServer')
end)

RegisterNetEvent('TransakcijaInfo')
AddEventHandler('TransakcijaInfo',function(type,transakcija,kod)
    SendNUIMessage({type = type,transakcija = transakcija,kod = kod})
end)

local banke = {
    {name="Banka", id=108, x=150.266, y=-1040.203, z=29.374},
    {name="Banka", id=108, x=-1212.980, y=-330.841, z=37.787},
    {name="Banka", id=108, x=-2962.582, y=482.627, z=15.703},
    {name="Banka", id=108, x=-112.202, y=6469.295, z=31.626},
    {name="Banka", id=108, x=314.187, y=-278.621, z=54.170},
    {name="Banka", id=108, x=-351.534, y=-49.529, z=49.042},
    {name="Banka", id=108, x=1175.0643310547, y=2706.6435546875, z=38.094036102295}
}   
Citizen.CreateThread(function()
    for k,v in ipairs(banke)do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, v.id)
        SetBlipScale(blip, 0.6)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 77)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(v.name))
        EndTextCommandSetBlipName(blip)
    end
end)
