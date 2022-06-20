---@param m number
---@return number
local function metters_to_inches(m)
	return m*10000/254
end

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
local blindness_time = 0
local blinding_time = 0

minetest.register_globalstep(function(dtime)
	if flash_start then
		flash_start = flash_start + dtime
		if flash_start > blinding_time then
			minetest.localplayer:hud_change(hud_id, "text", "blank.png")
			flash_start = nil
		elseif flash_start > blindness_time then
			local t = blinding_time - blindness_time
			local te = flash_start - blindness_time
			local f = 255 - math.round((te/t)*255)
			minetest.localplayer:hud_change(hud_id, "text", "cs_weapons_flash_hud.png^[opacity:"..f)
		else
			minetest.localplayer:hud_change(hud_id, "text", "cs_weapons_flash_hud.png")
		end
	end
end)

---@param pos Vector
function cs_client.hud.flash(pos)

	---https://www.youtube.com/watch?v=aTR7Surb80w
	---https://counterstrike.fandom.com/wiki/Flashbang

	--local ppos = minetest.localplayer:get_pos()

	--local distance = vector.distance(pos, ppos)
	--local distance_inches = metters_to_inches(distance)
	local angle = cs_client.utils.angle_player_view(pos)

	if angle < 53 then
		blindness_time = 1.88
		blinding_time = 4.87
	elseif angle < 72 then
		blindness_time = 0.45
		blinding_time = 3.4
	elseif angle < 101 then
		blindness_time = 0.08
		blinding_time = 1.95
	else
		blindness_time = 0.08
		blinding_time = 0.95
	end

	--blindness_time = blindness_time - (1/600 * distance_inches)
	--blinding_time = blinding_time - (1/600 * distance_inches)

	--print(blindness_time)
	--print(blinding_time)

	minetest.display_chat_message(angle)
	flash_start = 0
end

minetest.register_chatcommand("f", {
	func = function()
		cs_client.hud.flash(vector.zero())
		return true, "Done"
	end,
})

local mod_channel_name

cs_client.utils.register_on_joinplayer(function()
	mod_channel_name = "cs_client:flash:"..minetest.localplayer:get_name()
	minetest.mod_channel_join(mod_channel_name)
end)

minetest.register_on_modchannel_message(function(cname, sender, message)
	if sender == "" and cname == mod_channel_name then
		local parsed_pos = vector.from_string(message)
		if parsed_pos then
			cs_client.hud.flash(parsed_pos)
		else
			minetest.log("warning", "[cs_client] Server sended invalid data on ModChannel "..mod_channel_name)
		end
	end
end)


--[[print(dump(minetest.registered_on_death))

for k,v in pairs(minetest.registered_on_death) do
	print(minetest.callback_origins[v])
	print(dump(minetest.callback_origins))
end]]
