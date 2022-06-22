local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

---CS Client API
cs_client = {
	hud = {},
	menu = {},
	utils = {},
}

---HUD Text colors
cs_client.text = {
	normal = 0xFFFFFF,
	warning = 0xFF3B3B,
}

local modules = {
	utils = {
		"player_callbacks",
		"controls",
		"player",
	},
	api = {
		"api",
		"data",
	},
	hud = {
		"health",
		"center_msg",
		--"enemy_indicator",
		"kill_history",
		"menu_home",
		"menu_inventory",
		"hud_bar",
		"flash",
		"minimap",
	},
}

for cat,mod in pairs(modules) do
	for _,name in ipairs(mod) do
		dofile(modpath.."/"..cat.."/"..name..".lua")
	end
end
