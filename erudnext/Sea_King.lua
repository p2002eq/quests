function event_waypoint_arrive(e)
	if(e.wp == 6) then
		eq.signal(24056,1);
	elseif(e.wp == 7) then
		eq.signal(24056,2);
	end
end