function event_signal(e)
	if (e.signal == 1) then
		eq.set_timer("gnome",86400000);     -- One Day Timer for respawn
	end
end

function event_timer(e)
	if (e.timer == "gnome") then
		eq.stop_timer("gnome");
		eq.unique_spawn(48040,0,0,-468,254,17.79,63.2)
		eq.depop();
	end
end