---@param hp integer
---@return string
local function hp_to_cross(hp)
	if hp <= 20 then
		return "cs_player_cross.png^[brighten^[colorize:red:220"
	else
		return "cs_player_cross.png^[brighten^[colorize:white:250"
	end
end

---@param hp integer
---@return string
local function hp_to_bar(hp)
	if hp <= 20 then
		return "cs_player_health_bar.png^[colorize:red:220"
	else
		return "cs_player_health_bar.png^[colorize:white:250"
	end
end

---@param hp integer
---@return integer
local function hp_to_color(hp)
	if hp <= 20 then
		return cs_client.text.warning
	else
		return cs_client.text.normal
	end
end


local hud_elements = {}
minetest.register_globalstep(function()
	if minetest.localplayer then
		if not hud_elements.hp then
			local hp = minetest.localplayer:get_hp()

			hud_elements.hp = {}

			hud_elements.hp.cross = minetest.localplayer:hud_add({
				hud_elem_type = "image",
				text = hp_to_cross(hp),
				alignment = {x = 1, y = -1},
				position = {x = 0, y = 1},
				offset = {x = 20, y = -20},
				scale = {x = 0.3, y = 0.3},
				z_index = 2,
			})
			hud_elements.hp.cross_bg = minetest.localplayer:hud_add({
				hud_elem_type = "image",
				text = "cs_player_cross.png^[colorize:gray:250",
				alignment = {x = 1, y = -1},
				position = {x = 0, y = 1},
				offset = {x = 21, y = -19},
				scale = {x = 0.3, y = 0.3},
				z_index = -2,
			})

			hud_elements.hp.bar = minetest.localplayer:hud_add({
				hud_elem_type = "image",
				text = "cs_player_health_bar.png",
				alignment = {x = 1, y = -1},
				position = {x = 0, y = 1},
				offset = {x = 21+50+65, y = -30},
				scale = {x = hp/100, y = 1},
				z_index = 2,
			})
			hud_elements.hp.bar_bg = minetest.localplayer:hud_add({
				hud_elem_type = "image",
				text = "cs_player_health_bar_bg.png",
				alignment = {x = 1, y = -1},
				position = {x = 0, y = 1},
				offset = {x = 21+50+65, y = -30},
				scale = {x = 1, y = 1},
				z_index = -2,
			})

			hud_elements.hp.number = minetest.localplayer:hud_add({
				hud_elem_type = "text",
				text = tostring(hp),
				number = cs_client.text.normal,
				alignment = {x = 1, y = -1},
				position = {x = 0, y = 1},
				offset = {x = 20+50, y = -20},
				size = {x=2},
				style = 1,
				z_index = 2,
			})
		else
			local hp = minetest.localplayer:get_hp()
			minetest.localplayer:hud_change(hud_elements.hp.cross, "text", hp_to_cross(hp))

			minetest.localplayer:hud_change(hud_elements.hp.number, "number", hp_to_color(hp))
			minetest.localplayer:hud_change(hud_elements.hp.number, "text", tostring(hp))

			minetest.localplayer:hud_change(hud_elements.hp.bar, "scale", {x = hp/100, y = 1})
			minetest.localplayer:hud_change(hud_elements.hp.bar, "text", hp_to_bar(hp))
		end
	end
end)