function event_waypoint_arrive(e)
	if(e.wp == 6) then
		e.self:DoAnim(36); --kneel
	elseif(e.wp == 21) then
		e.self:DoAnim(36); --kneel
	end
end
