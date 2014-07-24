function event_death_complete(e)
	rand = math.random(100);
	if(rand > 97) then
		eq.unique_spawn(56152,0,0,-1294,1360,-103,0);
	elseif(rand > 75 and rand < 97) then
		eq.unique_spawn(56161,0,0,-2179,1319,-101.2,0);
	end
	e.self:Say("I die soon! Meldrath, help me!");
end

