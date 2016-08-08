-- vulak event, on players death spawns carrion drakes

function event_signal(e)
	if (e.signal == 1) then
		eq.spawn2(124315,0,0,-739,438,126,2.0);  -- carrion spawns if death during wave 3/4
	elseif (e.signal == 2) then
		eq.depop();
	end
end