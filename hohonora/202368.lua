local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and counter < 72 and qglobals.pop_hoh_garn == nil then
		eq.set_global("pop_hoh_garn", "1", 5, "F");
		e.other:Message(4,"You receive a character flag!");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
