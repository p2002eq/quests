local wolves = nil;

function event_spawn(e)
	eq.pause(2);
	wolves = 0;
end

function event_signal(e)
    if (e.signal == 1) then
		wolves = wolves + 1;
		e.self:AssignWaypoints(301+wolves);
	elseif(e.signal == 2) then
		wolves = wolves + 1;
		e.self:AssignWaypoints(341+wolves);
		e.self:SetRunning(true);
    end
end

function event_waypoint_arrive(e)
	if (e.wp == 1) then
		wolves = 0;
	end
end