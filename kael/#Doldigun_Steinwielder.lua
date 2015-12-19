function event_spawn(e)
	eq.set_timer("1", 1);
    e.self:SetRunning(true);
end

function event_waypoint_depart(e)
	if (e.self:GetX() == 1366) and (e.self:GetY() == -529) and (e.self:GetZ() == -118) then
        rq.signal(113632, 1);
		eq.depop_with_timer();
	end
end
