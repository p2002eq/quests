--First_Sergeant_Henrick_Iverson (211046)
--hohonora

local shout = false;

function event_spawn(e)
	eq.set_timer("time_check",5 * 1000);
end

function event_timer(e)
	if e.timer == "time_check" then
		ZoneTime = eq.get_zone_time();
		if (ZoneTime.zone_hour == 10 or ZoneTime.zone_hour == 22) and not shout then	--shouts at 10am and 10pm (36 min in between)
			shout = true;
			e.self:Shout("Soldiers, Fall in!")
			eq.set_timer("reset", 10 * 60 * 1000);
		end
	elseif e.timer == "reset" then
		eq.stop_timer(e.timer);
		shout = false;
	end
end
	