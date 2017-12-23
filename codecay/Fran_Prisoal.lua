function event_spawn(e)
	eq.set_timer("depop", 60 * 60 * 1000) -- 1hr depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
