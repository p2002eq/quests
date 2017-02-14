function event_death_complete(e)
	if(math.random(1,100) <= 20) then -- 20% chance
		eq.spawn2(179356,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	end
end