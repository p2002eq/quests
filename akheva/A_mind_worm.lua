--A_mind_worm (179346)
--depop script for traps
--akheva

function event_spawn(e)
	eq.set_timer("depop", 15 * 60 * 1000);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 15 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.stop_timer(e.timer);
		eq.depop();
	end
end