function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:SetRunning(1);
	end
	if(e.wp == 4) then
		e.self:SetRunning(0);
	end
	if(e.wp == 7) then
		e.self:SetRunning(1);
	end
	if(e.wp == 10) then
		e.self:SetRunning(0);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
