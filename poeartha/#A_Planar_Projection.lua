--#A_Planar_Projection (218367)
--Spawns after death of #A_Mystical_Arbitor_of_Earth (218363)
--poeartha

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if e.message:findi("hail") and  qglobals.pop_eartha_arbitor_projection == nil and counter < 54 then
		--e.other:Message(7,"Flames begin to surround your body.  You feel them moving around you, but your body does not burn.  Suddenly the flames begin to coalesce in your hands.");
		e.other:Message(15,"You've received a character flag!");
		eq.set_global("pop_eartha_arbitor_projection", "1", 5, "F");
		counter = counter + 1;
	end
end