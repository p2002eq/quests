function event_waypoint_arrive(e)
	if(e.wp == 3) then
		eq.signal(96075,1);
	elseif(e.wp == 4) then
		eq.signal(96075,2);
	elseif(e.wp == 18) then
		eq.signal(96364,1);
	elseif(e.wp == 19) then
		eq.signal(96364,2);
	end
end