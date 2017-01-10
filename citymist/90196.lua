-- Lord Rak`Ashiir for shaman epic (KOS version)

function event_spawn(e)
	eq.set_timer("depop", 3600000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer("depop");
		eq.depop();
	end
end