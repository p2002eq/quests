function event_spawn(e)
	e.self:AI_SetRoambox(750,488,-2090,1077,-1695,15000,30000);
end

function event_death_complete(e)
	random_result = math.random(100);
	
	if(random_result < 2) then
		eq.unique_spawn(70059,0,0,-1123.30,-1194.57,-98.32,122);
		-- e.self:Say("Spawning Bilge Farfathom");
	end
end

-- EOF aqua_goblin_mariner - randomly spawns 1 of 4 Bilge triggers around the zone)