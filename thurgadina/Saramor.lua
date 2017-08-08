function event_signal(e)
	
	if (e.signal == 1) then
		e.self:Say("Blasphemer!");
	elseif (e.signal == 2) then
		e.self:Say("Get him boys!");
	elseif (e.signal == 3) then
		e.self:SetRunning(true);
		eq.start(6);
	elseif (e.signal == 4) then
		e.self:Say("Well, don't ya just keep us in suspense now. What in the world was it?");
		eq.signal(115011,4,8000);
		eq.signal(115187,4,8000);
	end

end

function event_waypoint_arrive(e)

	if (e.wp == 4) then
		e.self:SetRunning(false);
	elseif (e.wp == 9) then
		eq.stop()
		e.self:Say("So good to see you, Rumagur. I hope you're feelin better today.");
		eq.signal(115011,3,8000);
		eq.signal(115187,3,8000);
	end

end
