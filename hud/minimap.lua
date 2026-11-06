core.register_globalstep(function()
	if core.ui.minimap then
		--core.ui.minimap:show()
		core.ui.minimap:set_shape(0)
		--core.ui.minimap:set_mode(2)
	end
end)