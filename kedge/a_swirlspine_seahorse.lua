function event_death_complete(e)
	if(math.random(100) < 25) then
		eq.spawns2(64092,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
end