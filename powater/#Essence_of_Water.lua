--#Essence_of_Water (216253)
--Coirnav, The Avatar of Water Encounter
--Plane of Water

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
	if e.message:findi("hail") and  qglobals.pop_water_coirnav_projection == nil and counter < 72 then
		e.other:Message(7,"Fast currents sweep around you.  The pressure is extreme but you are not caught in it.  Suddenly the current begins to coalesce in your hand.");
		e.other:Message(15,"You've received a character flag!");
		eq.set_global("pop_water_coirnav_projection", "1", 5, "F");
		e.other:SummonItem(29163); 	--Sphere of Coalesced Water
		counter = counter + 1;
	end
end