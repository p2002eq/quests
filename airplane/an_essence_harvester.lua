function event_death_complete(e)
	local add1 = eq.spawn2(71110,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	local add2 = eq.spawn2(71110,0,0,e.self:GetX()-10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.get_entity_list():GetMobByID(add1):AddToHateList(e.other);
	eq.get_entity_list():GetMobByID(add2):AddToHateList(e.other);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
