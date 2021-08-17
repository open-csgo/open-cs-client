local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

cs_client = {}

dofile(modpath.."/utils.lua")
dofile(modpath.."/api.lua")
dofile(modpath.."/menu_home.lua")