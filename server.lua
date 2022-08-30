ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('Informacije')
AddEventHandler('Informacije',function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local Banka = xPlayer.getAccount('bank').money
	local Ime = xPlayer.getName()
	TriggerClientEvent('Reload',source,Ime,Banka)
end)

RegisterServerEvent('GreskaServer')
AddEventHandler('GreskaServer',function()
	datum = os.date("%d.%m.%Y - %H:%M")
	kod = "<div class='lista error'><p><i class='fa fa-close' style='font-size: 15px;color:#e33030'></i> GRESKA:</p><span>Broj nije validan</span><div class='datum'><p>".. datum .."</p></div></div>"
	TriggerClientEvent('TransakcijaInfo',source,'transakcija','prebacio',kod)
end)


RegisterServerEvent('PrebaciNovacServer')
AddEventHandler('PrebaciNovacServer',function(kolicina)
	if type(kolicina) == 'string' or type(kolicina) == 'nil' then
		return
	end
	if tonumber(kolicina) <= 0 then
		return
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		local Kes = xPlayer.getMoney('money')
		local Banka = xPlayer.getAccount('bank')
		if Kes < tonumber(kolicina) then
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista error'><p><i class='fa fa-close' style='font-size: 15px;color:#e33030'></i> GRESKA:</p><span>Vi nemate $".. kolicina .." kod sebe</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','prebacio',kod)
		else
			xPlayer.addAccountMoney('bank',tonumber(kolicina))
			xPlayer.removeAccountMoney('money',tonumber(kolicina))
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista'><p><i class='fa fa-arrow-up' style='font-size: 15px;color:#30e34e;'></i> TRANSAKCIJA:</p><span>Prebacili ste $".. kolicina .." na banku!</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','prebacio',kod)
		end
	end
end)

RegisterServerEvent('PodigniNovacServer')
AddEventHandler('PodigniNovacServer',function(kolicina)
	if type(kolicina) == 'string' or type(kolicina) == 'nil' then
		return
	end
	if tonumber(kolicina) <= 0 then
		return
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		local Kes = xPlayer.getMoney()
		local Banka = xPlayer.getAccount('bank').money
		if Banka < tonumber(kolicina) then
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista error'><p><i class='fa fa-close' style='font-size: 15px;color:#e33030'></i> GRESKA:</p><span>Vi nemate $".. kolicina .." na racunu</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','podigao',kod)
		else
			xPlayer.addAccountMoney('money',tonumber(kolicina))
			xPlayer.removeAccountMoney('bank',tonumber(kolicina))
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista'><p><i class='fa fa-arrow-down' style='font-size: 15px;color:#30e34e;'></i> TRANSAKCIJA:</p><span>Podigli ste $".. kolicina .." sa racuna!</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','podigao',kod)
		end
	end
end)

RegisterServerEvent('PosaljiNovacServer')
AddEventHandler('PosaljiNovacServer',function(kolicina,igrac)
	if type(kolicina) == 'string' or type(kolicina) == 'nil' then
		return
	end
	if type(igrac) == 'string' or type(igrac) == 'nil' then
		return
	end
	if tonumber(kolicina) <= 0 then
		return
	end
	if tonumber(igrac) <= 0 then
		return
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		local xPlayer2 = ESX.GetPlayerFromId(igrac)
		if xPlayer2 == nil then
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista error'><p><i class='fa fa-close' style='font-size: 15px;color:#e33030'></i> GRESKA:</p><span>Korisnik nije pronadjen</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','poslao',kod)
		end
		local Banka = xPlayer.getAccount('bank').money
		local Banka2 = xPlayer2.getAccount('bank').money
		local Ime = xPlayer.getName()
		local Ime2 = xPlayer2.getName()
		if source == igrac then
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista error'><p><i class='fa fa-close' style='font-size: 15px;color:#e33030'></i> GRESKA:</p><span>Ne mozes poslati novac sam sebi</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','poslao',kod)
			return
		end
		if Banka < tonumber(kolicina) then
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista error'><p><i class='fa fa-close' style='font-size: 15px;color:#e33030'></i> GRESKA:</p><span>Vi imate $".. kolicina .." na racunu</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','poslao',kod)
		else
			xPlayer2.addAccountMoney('bank',tonumber(kolicina))
			xPlayer.removeAccountMoney('bank',tonumber(kolicina))
			datum = os.date("%d.%m.%Y - %H:%M")
			kod = "<div class='lista'><p><i class='fa fa-random' style='font-size: 15px;color:#30e34e;'></i> TRANSAKCIJA:</p><span>Poslali ste ".. Ime2 .. " $" .. kolicina.." na racun!</span><div class='datum'><p>".. datum .."</p></div></div>"
			kod2 = "<div class='lista'><p><i class='fa fa-random' style='font-size: 15px;color:#30e34e;'></i> TRANSAKCIJA:</p><span>".. Ime .. " vam je poslao/la $" .. kolicina.."</span><div class='datum'><p>".. datum .."</p></div></div>"
			TriggerClientEvent('TransakcijaInfo',source,'transakcija','poslao',kod)
			TriggerClientEvent('TransakcijaInfo',tonumber(igrac),'transakcija','primio',kod2)
			Poruka = '<c>'.. Ime ..'</c> vam je poslao/la <c>$' .. kolicina ..'</c> na racun'
			Trajanje = 3000
			FaIcon = 'fa fa-money'
			TriggerClientEvent('seekii_notify:SekiNotifyClient',igrac,FaIcon,Poruka,Trajanje)
		end
	end
end)