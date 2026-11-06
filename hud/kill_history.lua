--player name is no more than 20 chars long

local kill_hist = {
	{name="Fr", by="AFCM", assist="jeanv", method="shot"},
	{name="jeanv", by="AFCM", assist=nil, method="shot"},
}

local hud_ids = {}

cs_client.utils.register_on_joinplayer(function()
	for i = 1,5 do
		hud_ids[i] = {}
		hud_ids[i].bg = core.localplayer:hud_add({
			type = "image",
			text = "blank.png",
			alignment = {x = -1, y = 1},
			position = {x = 1, y = 0},
			offset = {x = -10, y = 10},
			scale = {x = 2, y = 2},
			z_index = 2,
		})

		hud_ids[i].name = core.localplayer:hud_add({
			type = "text",
			text = "blank.png",
			alignment = {x = -1, y = 1},
			position = {x = 1, y = 0},
			offset = {x = -10, y = 20},
			scale = {x = 1, y = 1},
			z_index = 3,
		})
	end
end)

---local timeout = 0

core.register_globalstep(function(dtime)
	if core.localplayer and #hud_ids == 5 then
		--timeout = timeout - dtime
		--if timeout <= 0 then
			--core.localplayer:hud_change(kill_hist.warn_text, "text", "")
			--core.localplayer:hud_change(kill_hist.warn_sign, "text", "blank.png")
			--core.localplayer:hud_change(kill_hist.text, "text", "")
			--core.localplayer:hud_change(kill_hist.bg, "text", "blank.png")
		--end

		for i = 1,5 do
			core.localplayer:hud_change(hud_ids[i].bg, "text", kill_hist[i] and "default_stone.png" or "blank.png")
		end
	end
end)

--[[
local timeout

---@param text string
function cs_client.hud.add_kill(text)
	if core.localplayer then
		timeout = 4
		--core.localplayer:hud_change(kill_hist.warn_text, "text", "Alert")
		--core.localplayer:hud_change(kill_hist.warn_sign, "text", "cs_player_msg_warning.png^[brighten^[colorize:red:175")
		--core.localplayer:hud_change(kill_hist.text, "text", text)
		--core.localplayer:hud_change(kill_hist.bg, "text", "cs_player_msg_bg.png")
	end
end]]