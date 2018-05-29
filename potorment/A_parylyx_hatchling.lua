--A_parylyx_hatchling (207295)
-- depop script for a hatchling spider traps in PoTorment

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 5 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end