--#The_Dreamkeeper
--Aid Eino Escort Quest
--ponightmare

function event_spawn(e)
	eq.set_timer("depop", 60 * 1000);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(204075, 1); --signal death to Aid Eino
end