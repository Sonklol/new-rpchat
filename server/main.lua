ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(playerId, playerName, message)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	local group = xPlayer.getGroup()
	if group ~= 'admin' and group ~= 'superadmin' and group ~= 'mod' then
	  if string.sub(message, 1, string.len('/')) ~= '/' then
		  CancelEvent()
  
		  playerName = GetRealPlayerName(playerId)
		  --TriggerClientEvent('chat:addMessage', -1, {args = {_U('ooc_prefix', playerName), message}, color = {128, 128, 128}})
		  TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('oop_prefix', playerId), args, { 160, 160, 160 })
	  end
	end
  end)

RegisterCommand('twt', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('twt_prefix', playerName), args}, color = {0, 153, 204}})
	end
end, false)

RegisterCommand('ilegal', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('ilegal_prefix', playerId), args}, color = { 255, 255, 0 }})
	end
end, false)

RegisterCommand('me', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('me_prefix', playerId), args, {255, 0, 0})
	end
end, false)

RegisterCommand('do', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('do_prefix', playerId), args, {0, 0, 255})
	end
end, false)

RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)

		TriggerClientEvent('chat:addMessage', player, {args = {"^1PM from "..GetPlayerName(source).. "[" .. source .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1PM SEND TO "..GetPlayerName(player).. "[" .. player .. "]: ^7" ..table.concat(args, " ")}, color = {255, 153, 0}})
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "ID de jugador incorrecta!")
	end

end,false)

RegisterCommand('ooc', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')

		local playerName = ESX.GetPlayerFromId(playerId)

		TriggerClientEvent('chat:addMessage', -1, {args = {_U('ooc_prefix', playerId), args}, color = { 160, 160, 160 }})
	end
end, false)

RegisterCommand('oop', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		args = table.concat(args, ' ')
		local playerName = GetRealPlayerName(playerId)

		TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, playerId, _U('oop_prefix', playerId), args, { 160, 160, 160 })
	end
end, false)

RegisterCommand('policia', function(source, args, rawCommand)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'police' then
		rawCommand = string.sub(rawCommand, 8)
		local name = GetPlayerName(source)

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('policia_prefix', source), rawCommand }, color = { 0, 168, 255 } })
	end
end, false)

RegisterCommand('ems', function(source, args, rawCommand)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'ambulance' then
		rawCommand = string.sub(rawCommand, 4)
		local name = GetPlayerName(source)

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ems_prefix', source), rawCommand }, color = { 255, 0, 0 } })
	end
end, false)

RegisterCommand('mecanico', function(source, args, rawCommand)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'mechanic' then
		rawCommand = string.sub(rawCommand, 9)
		local name = GetPlayerName(source)

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('mecanico_prefix', source), rawCommand }, color = { 139, 69, 19} })
	end
end, false)

RegisterCommand('taxi', function(source, args, rawCommand)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.job.name == 'taxi' then
		rawCommand = string.sub(rawCommand, 5)
		local name = GetPlayerName(source)

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('taxi_prefix', source), rawCommand }, color = { 255, 255, 0 } })
	end
end, false)

--[[RegisterCommand('policia', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == 'police' then
			args = table.concat(args, ' ')

			local playerName = ESX.GetPlayerFromId(playerId)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('policia_prefix', playerId), args}, color = { 0, 168, 255 }})
		end
	end
end, false)

RegisterCommand('ems', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == 'ambulance' then
			args = table.concat(args, ' ')

			local playerName = ESX.GetPlayerFromId(playerId)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('ems_prefix', playerId), args}, color = { 255, 0, 0 }})
		end
	end
end, false)

RegisterCommand('mecanico', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == 'mechanic' then
			args = table.concat(args, ' ')

			local playerName = ESX.GetPlayerFromId(playerId)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('mecanico_prefix', playerId), args}, color = { 139, 69, 19}})
		end
	end
end, false)

RegisterCommand('taxi', function(playerId, args, rawCommand)
	if playerId == 0 then
		print('esx_rpchat: you can\'t use this command from console!')
	else
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.job.name == 'taxi' then
			args = table.concat(args, ' ')

			local playerName = ESX.GetPlayerFromId(playerId)

			TriggerClientEvent('chat:addMessage', -1, {args = {_U('taxi_prefix', playerId), args}, color = { 255, 255, 0 }})
		end
	end
end, false)]]

function GetRealPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end
