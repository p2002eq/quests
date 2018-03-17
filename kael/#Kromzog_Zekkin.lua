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
	eq.spawn2(113634,29,0,1130.3,-749.6,-125.6,253.2);  --Spawns Zirron Windchill
end
