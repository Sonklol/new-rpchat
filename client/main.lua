--[[RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(target)
	local playerCoords = GetEntityCoords(playerPed)
	local targetCoords = GetEntityCoords(targetPed)

	if target == player or #(playerCoords - targetCoords) < 20 then
		TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
	end
end)]]
RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
    local player = PlayerId()
    local target = GetPlayerFromServerId(playerId)

    local playerPed = PlayerPedId()
    local targetPed = GetPlayerPed(target)
    local playerCoords = GetEntityCoords(playerPed)
    local targetCoords = GetEntityCoords(targetPed)

    --local pVar = "rpchat- pid: "..tostring(player).." / tarPID: "..tostring(playerId).." / targetret: "..tostring(target).." / pDist meters: "..tostring(#(playerCoords - targetCoords))
    --print(pVar)

    if target ~= -1 then
        if target == player or #(playerCoords - targetCoords) < 20 then
            TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
        end
    end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/ooc',  _U('ooc_help'),  {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/oop',   _U('oop_help'),   {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	--TriggerEvent('chat:addSuggestion', '/news', _U('news_help'), {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/ilegal', _U('ilegal_help'), {{name=_U('ooc_argument_name'), help=_U('ooc_argument_help')}})
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('ooc_argument_name'), help = _U('ooc_argument_name') } } )
	TriggerEvent('chat:addSuggestion', '/policia',   _U('policia_argument_help'),   { { name = _U('policia_argument_name'), help = _U('policia_argument_name') } } )
	TriggerEvent('chat:addSuggestion', '/ems',   _U('ems_argument_help'),   { { name = _U('ems_argument_name'), help = _U('ems_argument_name') } } )
	TriggerEvent('chat:addSuggestion', '/mecanico',   _U('mecanico_argument_help'),   { { name = _U('mecanico_argument_name'), help = _U('mecanico_argument_name') } } )
	TriggerEvent('chat:addSuggestion', '/taxi',   _U('taxi_argument_help'),   { { name = _U('taxi_argument_name'), help = _U('taxi_argument_name') } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/ooc')
		TriggerEvent('chat:removeSuggestion', '/oop')
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/me')
		--TriggerEvent('chat:removeSuggestion', '/news')
		TriggerEvent('chat:removeSuggestion', '/ilegal')
		TriggerEvent('chat:removeSuggestion', '/do')
		TriggerEvent('chat:removeSuggestion', '/policia')
		TriggerEvent('chat:removeSuggestion', '/ems')
		TriggerEvent('chat:removeSuggestion', '/mecanico')
		TriggerEvent('chat:removeSuggestion', '/taxi')
	end
end)