--LUA for changing of the guard shout in hohonora every 36 min (12 hrs game time)

function event_spawn(e)
	eq.set_timer("time_check",5 * 1000);
end

function event_timer(e)
	if e.timer == "time_check" then
		ZoneTime = eq.get_zone_time();
		if ZoneTime.zone_hour == 6 or ZoneTime.zone_hour == 18 then
			eq.zone_emote(7,"You hear a chime in the distance, and a voice booms in your ears, 'It is now the time for the changing of the guard!'");
			eq.depop_with_timer();
		end
	end
end
	