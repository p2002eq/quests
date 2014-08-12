
function event_waypoint_arrive(e)
	if(e.wp eq 14) then
		e.self:SetAppearance(1);
	end
	if(e.wp eq 28) then
		plugin::DoAnim("kneel");
	end
	if(e.wp eq 52) then
		e.self:SetAppearance(1);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
