function event_spawn(e)
	eq.set_timer("depop",7200000);
end

function event_timer(e)
	eq.depop_with_timer();
	e.self:Reset();
end

function event_death_complete(e)
	e.self:Reset();
end