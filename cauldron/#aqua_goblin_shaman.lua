function event_death_complete(e)
	random_result = math.random(100);
	
	if(random_result < 98) then
		eq.spawn2(70063,6,0,-974.5,436.4,-343.8,29);
		-- e.self:Say("Spawning spawn rat");
	else
		eq.spawn2(70059,4,0,-1123.30,-1194.57,-98.32,122);
		-- e.self:Say("Spawning Bilge Farfathom");
	end
end

-- EOF aqua_goblin_shaman (trigger for #Bilge_Farfathom 70059)