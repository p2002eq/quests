--A_Planar_Projection (212066)
--Spawns on death of The Protector of Dresolik
--solrotower

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000); --10 min
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and counter < 72 and qglobals.pop_sol_ro_dresolik == nil then
		eq.set_global("pop_sol_ro_dresolik", "1", 5, "F");
		e.other:Message(7,"As the planar projection's thoughts enter your own, you feel a bolt of energy surge through your arm.")
		e.other:Message(15,"You've received a character flag!");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
