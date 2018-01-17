--A_Planar_Projection (212067)
--Spawns on death of Jiva
--solrotower

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000); --10 min
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and counter < 72 and qglobals.pop_sol_ro_jiva == nil then
		eq.set_global("pop_sol_ro_jiva", "1", 5, "F");
		e.other:Message(7,"As the planar projection's thoughts enter your own, you feel your body fill with strength.")		
		e.other:Message(15,"You receive a character flag!");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
