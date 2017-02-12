-- A burrower parasite in The Burrower Beast event

event_mobs = { 164130, 164132, 164133, 164129, 164128, 164131, 164127, 164134 };

function event_spawn(e)
	eq.set_timer('depop', 60 * 60 * 1000);
end

function event_timer(e)
	if e.timer == 'depop' then
		cleanup();
		eq.depop();
	end
end

function event_death_complete(e)
	cleanup();
end

function cleanup()
	for _, mob in ipairs(event_mobs) do
		eq.depop_all(mob);
	end
end
