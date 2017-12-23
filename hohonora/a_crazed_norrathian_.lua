function event_signal(e)
	eq.depop();
end

function event_death_complete(e)
	eq.signal(211081,7,1);
end