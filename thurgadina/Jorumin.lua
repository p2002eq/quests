function event_signal(e)
	if (e.signal == 1) then
		e.self:Say("Over my dead body!");
	elseif (e.signal == 2) then
		e.self:SetRunning(true);
		eq.start(8);	
	end
end

function event_waypoint_arrive(e)
	if (e.wp == 4) then
		e.self:SetRunning(false);
	elseif (e.wp ==	9) then
		eq.stop();
	end
end
