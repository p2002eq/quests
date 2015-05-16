function event_spawn(e)
	eq.set_timer("check",30000);
end

function event_signal(e)
	if(e.signal == 1) then
		eq.set_timer("check",30000);
	end
end

function event_timer(e)
	if(e.timer == "check") then
		eq.signal(80002,1);
		eq.stop_timer("check");
	end
end