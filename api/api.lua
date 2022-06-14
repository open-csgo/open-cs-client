local table = table

local ipairs = ipairs

local gamestate = {
	state = "game_loading",
	informations = {},
}

function cs_client.get_gamestate()
	return gamestate
end

function cs_client.set_gamestate(new_gamestate)
	gamestate = new_gamestate
end

cs_client.registered_on_gamestate_change = {}

function cs_client.register_on_gamestate_change(func)
	table.insert(cs_client.registered_on_gamestate_change, func)
end

function cs_client.change_gamestate(new_gamestate)
	local old_gamestate = cs_client.get_gamestate()
	cs_client.set_gamestate(new_gamestate)
	for _,func in ipairs(cs_client.registered_on_gamestate_change) do
		func(old_gamestate, new_gamestate)
	end
end

cs_client.utils.register_on_joinplayer(function()
	cs_client.change_gamestate({
		state = "menu",
		informations = {
			page = "loading",
		},
	})
end)