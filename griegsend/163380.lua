-- depop script for a trap mob in Grieg's End

function event_spawn(e)
	eq.start_timer('depop', 20 * 60 * 1000);
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.depop();
	end
end
