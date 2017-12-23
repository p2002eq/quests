function event_death_complete(e)
	eq.signal(207014,0);          
	eq.spawn2(207066,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());           
end