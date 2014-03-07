function event_death_complete(e)
	-- on death of soul harvester one a_soul tamer spawn
	local add1 = eq.spawn2(71100,0,0,e.self:GetX()+10,e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	eq.get_entity_list():GetMobByID(add1):AddToHateList(e.other);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
