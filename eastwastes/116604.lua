function event_spawn(e)
	eq.set_timer("depop", 600000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.signal(116005, 99); -- Tain Hammerfrost
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(116005, 99); -- Tain Hammerfrost
end