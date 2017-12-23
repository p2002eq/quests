function event_signal(e)
	eq.depop();
end

function event_death_complete(e)
	eq.signal(211081,1,1);
end