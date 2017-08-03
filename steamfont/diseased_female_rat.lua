--Bertoxxulous Initiate quest npc

function event_death_complete(e)
	eq.spawn2(56086,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --a_young_plague_rat
	eq.spawn2(56086,0,0,e.self:GetX()+5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()); --a_young_plague_rat
	eq.spawn2(56086,0,0,e.self:GetX()+5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); --a_young_plague_rat
	eq.spawn2(56086,0,0,e.self:GetX()-5,e.self:GetY()+5,e.self:GetZ(),e.self:GetHeading()); --a_young_plague_rat
	eq.spawn2(56086,0,0,e.self:GetX()-5,e.self:GetY()-5,e.self:GetZ(),e.self:GetHeading()); --a_young_plague_rat
end
