local wolves = nil;

function event_spawn(e)
	eq.pause(2);
	wolves = 0;
end

function event_signal(e)
    if (e.signal == 1) then
		wolves = wolves + 1;
		e.self:AssignWaypoints(277+wolves);
    end
end

function event_waypoint_depart(e)
	if (e.wp == 1) then
		e.self:SetRunning(true);
	end
end