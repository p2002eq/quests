--script for Geb Theatre pathing

function event_waypoint_arrive(e)
	if (e.wp == 6 ) then
		e.self:SetAppearance(1);
	end

end

