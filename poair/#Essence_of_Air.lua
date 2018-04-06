--#Essence_of_Air (215412)
--Xegony_the_Queen_of_Air Encounter
--Plane of Air

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
	if e.message:findi("hail") and  qglobals.pop_wind_xegony_projection == nil and counter < 72 then
		e.other:Message(7,"Whipping winds whirl about, and suddenly you are engulfed by a tempest!  The wind coalesces in your hand as an Amorphous Cloud of Air.");
		e.other:Message(15,"You've received a character flag!");
		eq.set_global("pop_wind_xegony_projection", "1", 5, "F");
		e.other:SummonItem(29164); 	--Amorphous Cloud of Air
		counter = counter + 1;
	end
end