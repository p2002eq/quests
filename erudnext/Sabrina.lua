function event_spawn(e)
	eq.spawn_condition("erudnext",0,1,0);
	eq.spawn_condition("erudnext",0,2,0);
end

function event_signal(e)
	if(e.signal == 1) then
		eq.start(21);
	elseif(e.signal == 2) then
		eq.stop();
	else
		local count = eq.get_entity_list():CountClient();
		if(count == 1) then
			local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
			local hour = zone_time["zone_hour"] + 1;
			-- We know we can have a boat at 1,4,5,8,9,or 12
			if(hour ~= 1 and hour ~= 9 and hour ~= 5 and hour ~= 4 and hour ~= 12 and hour ~= 8 and
			hour ~= 13 and hour ~= 21 and hour ~= 17 and hour ~= 16 and hour ~= 24 and hour ~= 20) then
				eq.spawn_condition("erudnext",0,1,0);
				eq.spawn_condition("erudnext",0,2,0);
				e.self:Shout("Boat passengers: Sorry, you missed the boat and should be at safe coords.");
			else
				e.self:Shout("Letting spawn_events handle condition!");
			end
		end
	end
end