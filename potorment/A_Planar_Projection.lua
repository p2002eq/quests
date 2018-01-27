--A_Planar_Projection (221045)
--Plane of Torment

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
	if e.message:findi("hail") and qglobals.pop_pot_saryrn == nil and counter < 72 then
		eq.set_global("pop_pot_saryrn", "1", 5, "F");
		e.other:Message(12,"The Planar Projection seems to flicker in and out of existence. It seems to be impressed and grateful for the death of Saryrn.");
		e.other:Message(4,"You've received a character flag!");
		counter = counter + 1;
	end
end

