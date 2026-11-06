
cs_client.data = {}


local mod_channel_name

cs_client.utils.register_on_joinplayer(function()
	mod_channel_name = "cs_client:join_data:"..core.localplayer:get_name()
	core.mod_channel_join(mod_channel_name)
end)

core.register_on_modchannel_message(function(cname, sender, message)
	if sender == "" and cname == mod_channel_name then
		cs_client.data = core.deserialize(message, true)
		print(dump(cs_client.data))
		cs_client.change_gamestate({
			state = "menu",
			informations = {
				page = "main",
			},
		})
	end
end)

core.register_globalstep(function(dtime)
	--print(dump(cs_client.get_gamestate()))
end)