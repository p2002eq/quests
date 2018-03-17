-- depop script for a trap mob in The Grey

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.depop();
	end
end
