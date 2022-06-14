local hud_id

cs_client.utils.register_on_joinplayer(function()
	hud_id = minetest.localplayer:hud_add({
		hud_elem_type = "image",
		text = "blank.png",
		position = {x = 0, y = 0},
		alignment = {x = 1, y = 1},
		scale = {x = -100, y = -100},
		z_index = 1000,
	})
end)


local flash_start
minetest.register_globalstep(function(dtime)
	print(dtime)
	if flash_start then
		flash_start = flash_start + dtime
		if flash_start >= 0 and flash_start < 2 then
			minetest.localplayer:hud_change(hud_id, "text", "cs_weapons_bullet_hole.png^[brighten")
		elseif flash_start > 5 then
			minetest.localplayer:hud_change(hud_id, "text", "blank.png")
			flash_start = nil
		else
			minetest.localplayer:hud_change(hud_id, "text", "cs_weapons_bullet_hole.png")
		end
	end
end)

---@param pos Vector
function cs_client.hud.flash(pos)
	---@type Vector
	local ppos = minetest.localplayer:get_pos()

	local distance = vector.distance(pos, ppos)

	--TODO: check if player see the grenade on the flash

	--minetest.localplayer:hud_change(hud_id, "text", "cs_weapons_bullet_hole.png")
	--minetest.after(3, function()
	--	minetest.localplayer:hud_change(hud_id, "text", "blank.png")
	--end)
	flash_start = 0
end

minetest.register_chatcommand("f", {
	func = function()
		cs_client.hud.flash(vector.zero())
		return true, "Done"
	end,
})