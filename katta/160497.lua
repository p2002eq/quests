
function event_spawn(e)
	eq.set_timer('depop', 30 * 60 * 1000)
end

function event_timer(e)
	if e.timer == 'depop' then
		eq.stop_timer(e.timer)
		eq.depop()
	end
end