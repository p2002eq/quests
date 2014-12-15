function event_spawn(e)
	e.self:AI_SetRoambox(750,488,-2090,1077,-1695,15000,30000);
end

function event_death_complete(e)
	random_result = math.random(100);
	
	if(random_result < 98) then
		eq.spawn2(70063,6,0,-974.5,436.4,-343.8,29);
		-- e.self:Say("Spawning #a_cauldron_rat");
	else
		eq.unique_spawn(70059,0,0,-1123.30,-1194.57,-98.32,122);
		-- e.self:Say("Spawning Bilge Farfathom");
	end
end

-- EOF aqua_goblin_shaman (trigger for #Bilge_Farfathom 70059)