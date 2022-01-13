local registered_on_joinplayer = {}

local has_run = false

function cs_client.utils.register_on_joinplayer(func)
	table.insert(registered_on_joinplayer, func)
end

minetest.register_globalstep(function()
	if not has_run and minetest.localplayer then
		for _, func in pairs(registered_on_joinplayer) do
			func()
		end
		has_run = true
	end
end)