function event_combat(e)
	e.self:Say("Your bones will be crushed by the Kromrif of Kael Drakkel!");
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
	eq.spawn2(113624,0,0,1180,-839,-125.50, 120); --Spawns Khalerogg Dorfenbane
end
