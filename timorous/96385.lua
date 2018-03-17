-- Draz_Nurakk's_Image (96385) for BST epic

function event_spawn(e)
	eq.set_timer('depop', 24 * 60 * 60 * 1000) -- 24 hour depop timer - this is intentionally long, as a fail here will require redoing whole epic up to this part
end

function event_timer(e)
	eq.stop_timer(e.timer)
	if e.timer == 'depop' then
		eq.depop()
	end
end