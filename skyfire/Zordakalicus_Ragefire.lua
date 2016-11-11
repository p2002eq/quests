-- EPIC CLERIC -skyfire-
function event_spawn(e)
	eq.set_timer("depop", 1800000)
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end