function event_spawn(e)
	e.self:SetRunning(true);
	eq.move_to(-3169 + math.random(-30,30), -1751 + math.random(-30,30), -112,-1,true);	--path to Room 2
	eq.set_timer("fail", 60 * 1000);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("fail");
	else
		eq.set_timer("fail", 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "fail" then
		eq.stop_timer(e.timer);
		eq.signal(211072,1);	--send failure signal
	end
end
