function event_spawn(e)
	eq.set_timer("set",5000);
end

function event_timer(e)
	eq.signal(56105,2);
	eq.stop_timer("set");
end
		