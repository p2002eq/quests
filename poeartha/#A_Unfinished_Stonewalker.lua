--#A_Unfinished_Stonewalker (218377)
--depop script for trap mob
--poeartha

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 15 * 60 * 1000);
		e.self:SaveGuardSpot(true);	--will corpse camp
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end