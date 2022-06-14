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

local function menu(gamestate)
	local page = gamestate.informations.page

	local header = table.concat({
		"formspec_version[4]",
		"size[18,10]",
	})

	if page == "loading" then
		return header.."label[5,5;Loading...]"
	elseif page == "main" then
		return header..table.concat({
			"box[0.25,0.25;1,1;gray]",
			"style_type[button;border=false;content_offset=0]",
			"style[play;fgimg=cs_menu_play_base.png;fgimg_hovered=cs_menu_play_hovered.png;content_offset=0]",
			"image_button[0.25,1.4;1,1;;play;;false;false;]",
			"tooltip[play;Play Open CS]",
			"image_button[0.25,1.4;1,1;;play;;false;false;]",
			"button[0.25,2.6;1,1;inv;I]",
			"tooltip[inv;Inventory]",
			--"button_exit[0.25,8.75;1,1;quit;Q]",
			"style[quit;fgimg=cs_menu_shutdown_base.png;fgimg_hovered=cs_menu_shutdown_hovered.png;content_offset=0]",
			"image_button[0.25,8.75;1,1;;quit;;false;false;]",
			"tooltip[quit;Quit Game]",
		})
	end
end

cs_client.utils.register_on_joinplayer(function()
	minetest.display_chat_message(dump(cs_client.get_gamestate()))
	minetest.show_formspec("cs_client:main_menu", menu(cs_client.get_gamestate()))
end)

minetest.register_on_formspec_input(function(formname, fields)
	if formname == "cs_client:main_menu" and fields.quit then
		minetest.disconnect()
	end
end)