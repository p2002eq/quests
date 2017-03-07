-- #a_restless_burrower (154369) for Restless Burrower event

function event_spawn(e)
	started = false
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer)
		eq.signal(154091, 99)
		eq.depop()
	end
end

function event_combat(e)
	if not started then
		eq.set_timer('depop', 30 * 60 * 1000)
		started = true
	end
end

function event_death_complete(e)
	eq.stop_all_timers()
	eq.signal(154091, 99)
end
