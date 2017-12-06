--a_deathguard (154058)
--Khati Sha Event

function event_spawn(e)
	eq.set_timer("depop", 60 * 60 * 1000);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(154122,20); --signal #arcanist_trigger to increment death counter
end