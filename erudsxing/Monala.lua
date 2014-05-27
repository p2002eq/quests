function event_spawn(e)
	eq.spawn_condition("erudsxing",0,1,0);
	eq.spawn_condition("erudsxing",0,2,0);
end

function event_signal(e)
	local count = eq.get_entity_list():CountClient();
	if(count == 1) then
		if(e.signal == 1) then
			local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.	
			local hour = zone_time["zone_hour"] + 1;
			-- No boat will spawn at 4,8, or 12.
			if(hour == 4 or hour == 8 or hour == 12 or hour == 16 or hour == 20 or hour == 24) then
				eq.spawn_condition("erudsxing",0,1,0);
				eq.spawn_condition("erudsxing",0,2,0);
			end
		else
			eq.spawn_condition("erudsxing",0,1,0);
			eq.spawn_condition("erudsxing",0,2,0);
		end
	end			
end