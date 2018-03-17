local archer = nil;

function event_spawn(e)
	eq.pause(2);
	archer = 0;
end

function event_signal(e)
    if (e.signal == 1) then
		archer = archer + 1;
		e.self:AssignWaypoints(285+archer);
	elseif (e.signal == 2) then
		archer = archer + 1;
		e.self:AssignWaypoints(325+archer);
		e.self:SetRunning(true);
    end
end

function event_waypoint_arrive(e)
	if (e.wp == 1) then
		archer = 0;
	end
end
