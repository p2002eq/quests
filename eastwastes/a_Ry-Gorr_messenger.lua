function event_waypoint_depart(e)
	if (e.wp == 19) then
		eq.set_timer("1", 60000); --1 min timer
	end
end

function event_timer(e)
	eq.stop_timer("1");
	eq.depop_with_timer();
end
