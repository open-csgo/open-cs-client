minetest.register_globalstep(function()
	if minetest.ui.minimap then
		--minetest.ui.minimap:show()
		minetest.ui.minimap:set_shape(0)
		--minetest.ui.minimap:set_mode(2)
	end
end)