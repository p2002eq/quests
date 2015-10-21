function event_death_complete(e)
	local random_result = math.random(100);
	    if(random_result <= 10) then
			eq.spawn2(111241,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- angry librarian
		end
end