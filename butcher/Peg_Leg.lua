function event_death_complete(e)
	-- local x = e.self:GetX();
	-- local y = e.self:GetY();
	-- local z = e.self:GetZ();
	-- local h = e.self:GetHeading();
	eq.spawn2(68251,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

--Submitted by: Jim Mills
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
