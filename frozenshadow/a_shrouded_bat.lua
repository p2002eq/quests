function event_death_complete(e)
	local random_result = math.random(100);
	eq.spawn2(111245,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());  -- an_enraged_vampire    
	    if(random_result <= 15) then
			eq.unique_spawn(111250,0,0,21.1,260.7,355.0); -- Tserrina
		end
end