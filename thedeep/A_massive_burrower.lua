-- A massive burrower for The Burrower Beast event

function event_spawn(e)
	eq.set_timer('reset', 1000)
end

function event_timer(e)
	if e.timer == 'reset' then
		e.self:WipeHateList();
	end
end
