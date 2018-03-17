function event_spawn(event)
	eq.set_timer("depop", 120000);
end

function event_timer(event)
	eq.depop();
	eq.stop_timer("depop");

end