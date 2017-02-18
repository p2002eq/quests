function event_death_complete(e)
	local chance_spawn = math.random(100);
	if(chance_spawn <= 20) then -- 20% chance
		eq.spawn2(179356,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
	end
end