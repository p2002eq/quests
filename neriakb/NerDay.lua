function event_spawn(e)
	eq.set_timer("go",5000);
end

function event_timer(e)
	eq.signal(41079,2);
	eq.signal(41080,2);
	eq.stop_timer("go");
end