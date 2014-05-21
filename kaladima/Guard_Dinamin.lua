function event_waypoint_arrive(e)
	if(e.wp == 6) then
		e.self:DoAnim(36); --kneel
	elseif(e.wp == 21) then
		e.self:DoAnim(36); --kneel
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
