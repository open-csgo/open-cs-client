local player_offset = vector.new(0, 1.625, 0)

---Get the angle between a position and the player look direction (in degrees).
---@param pos Vector
---@return number
function cs_client.utils.angle_player_view(pos)
	local p = minetest.localplayer
	if p then
		local l = p:get_look_dir()
		local ppos = p:get_pos()

		local rad = vector.angle(pos - (ppos + player_offset), l)

		return math.deg(rad)
	else
		return 0
	end
end