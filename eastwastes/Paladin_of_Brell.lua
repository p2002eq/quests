local paladins = nil;

function event_spawn(e)
	eq.pause(2);
	paladins = 0;
end

function event_signal(e)
    if (e.signal == 1) then
		paladins = paladins + 1;
		e.self:AssignWaypoints(277+paladins);
	elseif (e.signal == 2) then
		paladins = paladins + 1;
		e.self:AssignWaypoints(317+paladins);
		e.self:SetRunning(true);
    end
end

function event_waypoint_arrive(e)
	if (e.wp == 1) then
		paladins = 0;
	end
end