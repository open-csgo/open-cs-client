--player name is no more than 20 chars long

local timeout = 0

local kill_hist = nil
minetest.register_globalstep(function(dtime)
	if minetest.localplayer then
		if not kill_hist then
			kill_hist = {{}, {}, {}, {}, {}}
            for i = 1,5 do
                kill_hist[i].bg = minetest.localplayer:hud_add({
                    hud_elem_type = "image",
                    text = "default_stone.png",
                    alignment = {x = -1, y = 1},
                    position = {x = 1, y = 0},
                    offset = {x = -20, y = 50},
                    scale = {x = 1, y = 1},
                    z_index = 2,
                })
            end
		else
			timeout = timeout - dtime
			if timeout <= 0 then
				--minetest.localplayer:hud_change(kill_hist.warn_text, "text", "")
				--minetest.localplayer:hud_change(kill_hist.warn_sign, "text", "blank.png")
				--minetest.localplayer:hud_change(kill_hist.text, "text", "")
				--minetest.localplayer:hud_change(kill_hist.bg, "text", "blank.png")
			end
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