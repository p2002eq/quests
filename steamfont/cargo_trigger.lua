function event_spawn(e)
	eq.set_timer("time_check",10 * 1000);
end

function event_timer(e)
	if e.timer == "time_check" then
		ZoneTime = eq.get_zone_time();
		if ZoneTime.zone_hour == 7 then
			eq.signal(56105,2);
			eq.depop_with_timer();
		end
	end
end
		