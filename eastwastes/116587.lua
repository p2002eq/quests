function event_spawn(e)
	eq.set_timer("depop", 600000); -- 10 Minutes
	e.self:SetRunning(true);
	eq.move_to(-372, -2655, 178, 45, true);
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end