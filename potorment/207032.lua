function event_spawn(e)
	eq.set_timer("depop", 30 * 60 * 1000) -- 30 min depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop_with_timer();
	end
end


