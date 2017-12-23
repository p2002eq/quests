function event_signal(e)
	eq.depop();
end

function event_death_complete(e)
	eq.signal(211081,5,1);
end
