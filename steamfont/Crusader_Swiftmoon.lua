function event_spawn(e)
	eq.set_timer("depop", 3600000);
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end
