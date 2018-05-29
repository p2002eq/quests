--LUA for Amalgamation_of_Honor`s_Spirits spawn control script

function event_spawn(e)
	eq.set_timer("time_check",5 * 1000);
end

function event_timer(e)
	if e.timer == "time_check" then
		ZoneTime = eq.get_zone_time();
		if ZoneTime.zone_hour == 0 then
			eq.spawn2(211088,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--Spawn Amalgamation_of_Honor`s_Spirits
			eq.depop_with_timer();
		end
	end
end
	