--https://youtu.be/DDCTP9PKmC8

--hovered: #f2ffff
--base:    #c2f1f1

--cs_menu_shutdown_hovered.png
--

local table = table

cs_client.mainmenu = {}

function cs_client.mainmenu.register_loading_checkpoint(name)
end
--[[
formspec_version[4]
size[18,10]
box[0.25,0.25;1,1;gray]
style_type[button;border=false;content_offset=0]
button[0.25,1.4;1,1;play;P]
tooltip[play;Play Open CS]
button[0.25,2.6;1,1;inv;I]
tooltip[inv;Inventory]
button_exit[0.25,8.75;1,1;quit;Q]
tooltip[quit;Quit Game]
]]
local menu_form = table.concat({
	"formspec_version[4]",
	"size[18,10]",
	--style
	--"bgcolor[#100E1DBB;true]",
	--"listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]",
	--"background9[5,5;1,1;gui_formbg.png;true;10]",
	--end style
	"box[0.25,0.25;1,1;gray]",
	"style_type[button;border=false;content_offset=0]",
	"style[play;fgimg=cs_menu_play_base.png;fgimg_hovered=cs_menu_play_hovered.png;content_offset=0]",
	"image_button[0.25,1.4;1,1;;play;;false;false;]",
	"tooltip[play;Play Open CS]",
	"button[0.25,2.6;1,1;inv;I]",
	"tooltip[inv;Inventory]",
	--"button_exit[0.25,8.75;1,1;quit;Q]",
	"style[quit_game;fgimg=cs_menu_shutdown_base.png;fgimg_hovered=cs_menu_shutdown_hovered.png;content_offset=0]",
	"image_button[0.25,8.75;1,1;;quit_game;;false;false;]",
	"tooltip[quit;Quit Game]",
})

local menu_tabs = {
	main = {
		icon = {
			texture = "cs_menu_play",
			desc = "Play Open CS",
		},
	},
	play = {
		icon = {
			texture = "cs_menu_play",
			desc = "Play Open CS",
		},
	},
	awards = {},
	inventory = {},
}


local menu_base = table.concat({
	"formspec_version[4]",
	"size[18,10]",
	--style
	--"bgcolor[#100E1DBB;true]",
	--"listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]",
	--"background9[5,5;1,1;gui_formbg.png;true;10]",
	--end style
})

function cs_client.menu.get_menu_form(page)
	local form = menu_base
	return form
end

cs_client.utils.register_on_joinplayer(function()
	minetest.show_formspec("cs_client:main_menu", menu_form)
end)

minetest.register_on_formspec_input(function(formname, fields)
	if formname == "cs_client:main_menu" then
		if fields.quit_game then
			minetest.disconnect()
		elseif fields.play then
			minetest.run_server_chatcommand("map", "")
		end
	end
end)