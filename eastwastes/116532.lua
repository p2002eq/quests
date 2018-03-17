function event_spawn(e)
	eq.set_timer("depop", 600000); -- 10 Minutes
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end