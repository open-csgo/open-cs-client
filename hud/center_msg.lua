--cs_player_msg_bg.png
--https://youtu.be/M-dFpwK5qGk?t=554

local timeout = 0

local msg_bar = nil
core.register_globalstep(function(dtime)
	if core.localplayer then
		if not msg_bar then
			msg_bar = {}
			msg_bar.warn_text = core.localplayer:hud_add({
				type = "text",
				text = "",
				number = cs_client.text.warning,
				alignment = {x = 0, y = -1},
				position = {x = 0.5, y = 1},
				offset = {x = 10, y = -190},
				size = {x=1, y=0},
				style = 1,
				z_index = 2,
			})
			msg_bar.warn_sign = core.localplayer:hud_add({
				type = "image",
				text = "blank.png",
				alignment = {x = 0, y = -1},
				position = {x = 0.5, y = 1},
				offset = {x = -25, y = -187},
				scale = {x = 0.05, y = 0.05},
				z_index = 2,
			})
			msg_bar.text = core.localplayer:hud_add({
				type = "text",
				text = "",
				number = cs_client.text.normal,
				alignment = {x = 0, y = -1},
				position = {x = 0.5, y = 1},
				offset = {x = 0, y = -165},
				size = {x=1, y=0},
				style = 0,
				z_index = 2,
			})
			msg_bar.bg = core.localplayer:hud_add({
				type = "image",
				text = "blank.png",
				alignment = {x = 0, y = -1},
				position = {x = 0.5, y = 1},
				offset = {x = 0, y = -150},
				scale = {x = 2, y = 2},
				z_index = -2,
			})
		else
			timeout = timeout - dtime
			if timeout <= 0 then
				core.localplayer:hud_change(msg_bar.warn_text, "text", "")
				core.localplayer:hud_change(msg_bar.warn_sign, "text", "blank.png")
				core.localplayer:hud_change(msg_bar.text, "text", "")
				core.localplayer:hud_change(msg_bar.bg, "text", "blank.png")
			end
		end
	end
end)

function cs_client.hud.add_center_msg(text)
	if core.localplayer then
		timeout = 4
		core.localplayer:hud_change(msg_bar.warn_text, "text", "Alert")
		core.localplayer:hud_change(msg_bar.warn_sign, "text", "cs_player_msg_warning.png^[brighten^[colorize:red:175")
		core.localplayer:hud_change(msg_bar.text, "text", text)
		core.localplayer:hud_change(msg_bar.bg, "text", "cs_player_msg_bg.png")
	end
end

core.register_chatcommand("cmsg", {
	func = function(param)
		cs_client.hud.add_center_msg("You kiled a teammate!")
	end,
})

---local mod_channel
local mod_channel_name

cs_client.utils.register_on_joinplayer(function()
	mod_channel_name = "cs_client:center_message:"..core.localplayer:get_name()
	core.mod_channel_join(mod_channel_name)
end)

core.register_on_modchannel_message(function(cname, sender, message)
	if sender == "" and cname == mod_channel_name then
		cs_client.hud.add_center_msg(message)
	end
end)
