--This code is derivated from BuckarooBanzai's server side minetest mod "controls" (under GNU-GPL V2.1)

local minetest = minetest

local os = os

local pairs = pairs

controls = {}

controls.player = {
	jump = {false},
	right = {false},
	left = {false},
	LMB = {false},
	RMB = {false},
	sneak = {false},
	aux1 = {false},
	down = {false},
	up = {false},
	zoom = {false},
	dig = {false},
	place = {false},
	movement_direction = {false},
	movement_speed = {false},
}

controls.registered_on_press = {}
function controls.register_on_press(func)
	controls.registered_on_press[#controls.registered_on_press+1] = func
end

controls.registered_on_release = {}
function controls.register_on_release(func)
	controls.registered_on_release[#controls.registered_on_release+1] = func
end

controls.registered_on_hold = {}
function controls.register_on_hold(func)
	controls.registered_on_hold[#controls.registered_on_hold+1]=func
end


minetest.register_globalstep(function()
	if minetest.localplayer then
		local player_controls = minetest.localplayer:get_control()
		for cname, cbool in pairs(player_controls) do
			--Press a key
			if cbool == true and controls.player[cname][1] == false then
				for _, func in pairs(controls.registered_on_press) do
					func(cname)
				end
				controls.player[cname] = {true, os.clock()}
			elseif cbool == true and controls.player[cname][1] == true then
				for _, func in pairs(controls.registered_on_hold) do
					func(cname, os.clock() - controls.player[cname][2])
				end
			--Release a key
			elseif cbool == false and controls.player[cname][1] == true then
				for _, func in pairs(controls.registered_on_release) do
					func(player, cname, os.clock() - controls.player[cname][2])
				end
				controls.player[cname] = {false}
			end
		end
	end
end)