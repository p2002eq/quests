function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("Over my dead body!");
	elseif (e.signal == 2) then
		e.self:SetRunning(1);
		e.self:Start(8);	
	end
end

function event_waypoint_arrive(e)
	if (e.wp == 4) then
		e.self:SetRunning(0);
	elseif (e.wp ==	9) then
		e.self:Stop();
	end
end
