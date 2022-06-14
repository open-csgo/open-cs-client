minetest.register_on_inventory_open(function(_)
	local menu_base = table.concat({
		"formspec_version[4]",
		"size[18,10]",
		"label[1,1;Client Side Inventory]"
		--style
		--"bgcolor[#100E1DBB;true]",
		--"listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]",
		--"background9[5,5;1,1;gui_formbg.png;true;10]",
		--end style
	})
	minetest.show_formspec("cs_client:inventory", menu_base)
	return true
end)