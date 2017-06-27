function event_combat(e)
	e.self:Say("You have stuck yer nose where it don't belong fool, I'll show ya the error of yer ways!");
end

function event_spawn(e)
	eq.set_timer("depop", 30*60*1000); --30 min despawn
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(113635,28,0,1130.3,-933.2,-125.6,126.8); --Spawns Vinric Thunderclap
end
