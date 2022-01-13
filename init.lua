local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

cs_client = {
	hud = {},
	menu = {},
	utils = {},
}

cs_client.text = {
	normal = 0xFFFFFF,
	warning = 0xFF3B3B,
}

local modules = {
	utils = {
		"player_callbacks",
		"controls",
	},
	api = {
		"api",
	},
	hud = {
		"health",
		"center_msg",
		--"kill_history",
		"menu_home",
	},
}

for cat,mod in pairs(modules) do
	for _,name in ipairs(mod) do
		dofile(modpath.."/"..cat.."/"..name..".lua")
	end
end