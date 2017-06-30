
function event_waypoint_arrive(e)
	if (e.wp == 4) then
		e.self:Say("Waypoint #4 reached");
		e.self:SetAppearance(1);
	elseif (e.wp == 5) then
		e.self:Say("Waypoint #5 reached");
		e.self:SetAppearance(1);
	elseif (e.wp == 6) then
		e.self:Say("Waypoint #6 reached");
		e.self:SetAppearance(1);
	elseif (e.wp == 7) then
		e.self:Say("Waypoint #7 reached");
		e.self:SetAppearance(1);
	end
end		
