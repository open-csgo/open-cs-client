local hud_ids = {}

cs_client.utils.register_on_joinplayer(function()
	hud_ids[1] = core.localplayer:hud_add({
		type = "image",
        position = {x=0.95, y=0.8},
        scale = {x = 2, y = 2},
        text = "default_stone.png",

        alignment = {x=0, y=0},

        offset = {x=0, y=0},

        size = { x=100, y=100 },

        z_index = 0,
	})

	hud_ids[2] = core.localplayer:hud_add({
		type = "image",
        position = {x=0.95, y=0.85},
        scale = {x = 2, y = 2},
        text = "default_stone.png",

        alignment = {x=0, y=0},

        offset = {x=0, y=0},

        size = { x=100, y=100 },

        z_index = 0,
	})

	hud_ids[3] = core.localplayer:hud_add({
		type = "image",
        position = {x=0.95, y=0.9},
        scale = {x = 2, y = 2},
        text = "default_stone.png",

        alignment = {x=0, y=0},

        offset = {x=0, y=0},

        size = { x=100, y=100 },

        z_index = 0,
	})

	hud_ids[4] = core.localplayer:hud_add({
		type = "image",
        position = {x=0.95, y=0.95},
        scale = {x = 2, y = 2},
        text = "default_stone.png",

        alignment = {x=0, y=0},

        offset = {x=0, y=0},

        size = { x=100, y=100 },

        z_index = 0,
	})
end)


core.register_globalstep(function(dtime)
	if core.localplayer and #hud_ids == 4 then
		local id = core.localplayer:get_wield_index() + 1
		for i = 1, 4 do
			core.localplayer:hud_change(hud_ids[i], "text", i == id and "default_stone.png^[brighten" or "default_stone.png")
		end
	end
end)

