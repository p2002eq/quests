function event_spawn(e)
	eq.set_timer("depop", 30*60*1000);	--30 min depop
end

function event_timer(e)
	eq.stop_timer(e.timer)
	eq.depop();
end