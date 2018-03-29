function event_spawn(e)
	eq.clear_proximity();
	eq.set_timer("prox_refresh", 5 * 1000);
end

function event_proximity_say(e)
	local GetTime = eq.get_zone_time();
	local qglobals = eq.get_qglobals(e.self, e.other)
	if (GetTime.zone_hour > 22 or GetTime.zone_hour < 6) and e.message:findi("quellious be my guide") and tonumber(qglobals.EinoTrigger) == 1 then
		eq.unique_spawn(204075,0,0,1685,-515,215,310);
		eq.depop_with_timer();
	end
end

function event_timer(e)
	if e.timer == "prox_refresh" then
		eq.stop_timer(e.timer);
		eq.set_timer("refresh", 30 * 1000);
		eq.set_proximity(e.self:GetX()-25,e.self:GetX()+25,e.self:GetY()-25,e.self:GetY()+25);
		eq.enable_proximity_say();
	end
end
