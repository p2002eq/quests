function event_spawn(e)
	eq.spawn2(116182,0,0,3406.9,-1722.2,142.9,191.5);
	eq.spawn2(116182,0,0,3406.9,-1722.2,142.9,191.5);
	eq.spawn2(116182,0,0,3390.1,-1744.3,146.4,191.5);
	eq.spawn2(116182,0,0,3393.8,-1777.2,149,191.5);
	eq.spawn2(116182,0,0,3395.6,-1794.3,151.6,191.5);
	eq.set_timer("depop", 600000);
end

function event_timer(e)
    if(e.timer == "depop") then
        eq.stop_timer(e.timer)
        eq.depopall(116182);
    end
end