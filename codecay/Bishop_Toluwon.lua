function event_spawn(e)
	eq.set_timer("depop", 60 * 60 * 1000); --1hr depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(200034,33,0,325,325,-71.5,138.6);
	eq.spawn2(200033,34,0,290,325,-71.5,138.6);
end



