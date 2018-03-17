-- Doomshade in Umbral Planes

function event_spawn(e)
	-- set timers for chants and depop
	eq.set_timer('depop', 60 * 60 * 1000);
end

function event_timer(e)
	-- depop after 1 hour.
	if e.timer == 'depop' then
		eq.stop_timer(e.timer);
		eq.depop()
	end
end
