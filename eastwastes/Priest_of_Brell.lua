local priests = nil;
local waypoint1 = false;

function event_spawn(e)
	eq.pause(2);
	priests = 0;
end

function event_signal(e)
    if (e.signal == 1) then
		priests = priests + 1;
		e.self:AssignWaypoints(293+priests);
	elseif (e.signal == 2) then
		priests = priests + 1;
		e.self:AssignWaypoints(333+priests);
		e.self:SetRunning(true);
    end
end

function event_waypoint_arrive(e)
	if (e.wp == 1) then
		priests = 0;
	end
end
