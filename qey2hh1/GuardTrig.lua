function event_spawn(e)
	eq.set_timer("depop",5000);
end

function event_timer(e)
	eq.signal(12090,1); -- Guard_McCluskey
	eq.signal(12147,1); -- Guard_Donlan
	eq.depop();
end