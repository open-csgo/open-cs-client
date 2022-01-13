local status = "loading"
function cs_client.get_game_state()
	return status
end

local checkpoints = {}
checkpoints.test = false

minetest.register_globalstep(function()
	for _,s in pairs(checkpoints) do
		if s == false then return end
	end
	status = "menu"
	minetest.log("error", "[client] menu")
end)

local channel
local channel_player

--[[
cs_client.utils.register_on_joinplayer(function()
	channel_player = "cs_player:state_"..minetest.localplayer:get_name()
	channel = minetest.mod_channel_join(channel_player)
end)
]]
channel = minetest.mod_channel_join("cs_player:state_singleplayer")

minetest.register_on_modchannel_message(function(channel_name, sender, message)
	minetest.log("error", "[client] "..channel_name..":"..message)
	if channel_name == "cs_player:state_singleplayer" then
		minetest.log("error", "[client] done:"..message)
		checkpoints.test = true
	end
end)