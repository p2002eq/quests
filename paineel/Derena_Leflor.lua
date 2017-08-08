function event_waypoint_arrive(e)
	if(e.wp == 14) then
		eq.set_anim(75039,1);
	elseif(e.wp == 28) then
		e.self:DoAnim(36);
	elseif(e.wp == 52) then
		eq.set_anim(75039,1);
	end
end
