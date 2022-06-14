--player name is no more than 20 chars long

local kill_hist = {
	{name="Fr", by="AFCM", assist="jeanv", method="shot"},
	{name="jeanv", by="AFCM", assist=nil, method="shot"},
}

local hud_ids = {}

cs_client.utils.register_on_joinplayer(function()
	for i = 1,5 do
		hud_ids[i] = {}
		hud_ids[i].bg = minetest.localplayer:hud_add({
			hud_elem_type = "image",
			text = "blank.png",
			alignment = {x = -1, y = 1},
			position = {x = 1, y = 0},
			offset = {x = -10, y = 10},
			scale = {x = 2, y = 2},
			z_index = 2,
		})

		hud_ids[i].name = minetest.localplayer:hud_add({
			hud_elem_type = "text",
			text = "blank.png",
			alignment = {x = -1, y = 1},
			position = {x = 1, y = 0},
			offset = {x = -10, y = 20},
			scale = {x = 1, y = 1},
			z_index = 3,
		})
	end
end)

local timeout = 0

minetest.register_globalstep(function(dtime)
	if minetest.localplayer and #hud_ids == 5 then
		--timeout = timeout - dtime
		--if timeout <= 0 then
			--minetest.localplayer:hud_change(kill_hist.warn_text, "text", "")
			--minetest.localplayer:hud_change(kill_hist.warn_sign, "text", "blank.png")
			--minetest.localplayer:hud_change(kill_hist.text, "text", "")
			--minetest.localplayer:hud_change(kill_hist.bg, "text", "blank.png")
		--end

		for i = 1,5 do
			minetest.localplayer:hud_change(hud_ids[i].bg, "text", kill_hist[i] and "default_stone.png" or "blank.png")
		end
	end
end)

function cs_client.hud.add_kill(text)
	if minetest.localplayer then
		timeout = 4
		--minetest.localplayer:hud_change(kill_hist.warn_text, "text", "Alert")
		--minetest.localplayer:hud_change(kill_hist.warn_sign, "text", "cs_player_msg_warning.png^[brighten^[colorize:red:175")
		--minetest.localplayer:hud_change(kill_hist.text, "text", text)
		--minetest.localplayer:hud_change(kill_hist.bg, "text", "cs_player_msg_bg.png")
	end
end