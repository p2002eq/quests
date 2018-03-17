function event_spawn(e)
	eq.spawn2(116182,0,0,3406.9,-1722.2,142.9,383); -- Kromrif Elite
	eq.spawn2(116182,0,0,3408.7,-1693.2,142.5,383); -- Kromrif Elite
	eq.spawn2(116182,0,0,3390.1,-1744.3,146.4,383); -- Kromrif Elite
	eq.spawn2(116182,0,0,3393.8,-1777.2,149,383); -- Kromrif Elite
	eq.spawn2(116182,0,0,3395.6,-1794.3,151.6,383); -- Kromrif Elite
	eq.set_timer("depop", 600000); -- 10 minutes
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop")
		e.self:Say("The cowards seem to have fled friends, thank you for your protection.");
		eq.depop_all(116182); -- Kromrif Elite
		eq.depop();
	end
end
