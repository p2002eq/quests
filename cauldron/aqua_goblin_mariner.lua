function event_death_complete(e)
	random_result = math.random(100);
	
	if(random_result < 50) then
		eq.spawn2(70061,0,0,-974.5,436.4,-343.8,29);
		-- e.self:Shout("Spawning #aqua goblin shaman");
	end
end

 -- an_aqua_goblin_mariner (trigger for #Bilge_Farfathom 70059)