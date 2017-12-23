function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10min depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end