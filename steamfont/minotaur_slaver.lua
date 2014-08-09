function event_death_complete(e)
	if(math.random(100) < 5) then
		eq.unique_spawn(56161,0,0,-2179,1319,-101.2,0);
	end
	e.self:Say("I die soon! Meldrath, help me!");
end

