local mark_dead;

function event_death_complete(e)
	if(mark_dead == "died") then
		-- e.self:Say("I already died once!");
	else
		eq.spawn2(70020,5,0,-296.37,-122.31,-349.32,122);
		-- e.self:Say("Starting cycle");
		mark_dead = "died";
	end
end

-- EOF aqua_goblin_mariner - randomly spawns 1 of 4 Bilge triggers around the zone)