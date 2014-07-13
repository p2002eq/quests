function event_waypoint_arrive(e)
	if((e.wp==1) or (e.wp==3)) then
		e.self:Say("Hail citizens.  Sentinel Creot of the High Guard is on watch.");
	end
	if(e.wp==1) then
		e.self:SetRunning(1);
	end
	if(e.wp==2) then
		e.self:SetRunning(0);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
