local hud_id

cs_client.utils.register_on_joinplayer(function()
	hud_id = minetest.localplayer:hud_add({
		hud_elem_type = "text",
        position = {x=0.5, y=0.5},
        name = "cs_client:enemy_indicator",
        scale = {x = 2, y = 2},
        text = "",
        number = cs_client.text.warning,
        alignment = {x=0, y=0},
        offset = {x=0, y=0},
        size = { x=100, y=100 },
        -- Size of element in pixels
        z_index = 0,
	})
end)

minetest.register_globalstep(function(dtime)
	if minetest.localplayer and hud_id then
		local pos1 = minetest.localplayer:get_pos()
		local look_dir = minetest.camera:get_look_dir()
		local pos2 = vector.add(pos1, vector.multiply(look_dir, 40))
		local ray = minetest.raycast(pos1, pos2, true, false)
		local ray_next = ray:next()
		if ray_next and ray_next.type == "object" and ray_next.ref and ray_next.ref:is_player() then
			minetest.localplayer:hud_change(hud_id, "text", ray_next.ref:get_player_name())
		else
			minetest.localplayer:hud_change(hud_id, "text", "")
		end
	end
end)