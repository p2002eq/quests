function event_timer(e)
	if e.timer == "depop" then
		eq.unload_encounter("RingTen");
		eq.depop();
	end
end