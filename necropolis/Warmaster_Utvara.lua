---Part of Vaniki Cycle

function event_spawn(e)
	eq.set_timer("depop", 7320000); --122 Hours
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end
