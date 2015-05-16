function event_spawn(e)
	eq.signal(80002,1);
end

function event_signal(e)
	eq.set_timer("check",30000);
end

function event_timer(e)
	eq.signal(80002,1);
end