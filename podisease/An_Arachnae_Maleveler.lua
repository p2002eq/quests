--An_Arachnae_Maleveler
--Spider adds from Aramin the Spider Guardian Event
--podisease

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
