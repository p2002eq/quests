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
			if(e.signal == 3) then
				local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
				local hour = zone_time["zone_hour"] + 1;
				-- We know we can have a boat at 1,2,5,6,9, or 10
				if(hour ~= 1 and hour ~= 2 and hour ~= 5 and hour ~= 6 and hour ~= 9 and hour ~= 10 and 
			   	   hour ~= 13 and hour ~= 14 and hour ~= 17 and hour ~= 18 and hour ~= 21 and hour ~= 22) then
					eq.spawn_condition("erudnext",0,1,0);
					eq.spawn_condition("erudnext",0,2,0);
				end
			elseif(e.signal == 4) then
				eq.spawn_condition("erudnext",0,1,0);
				eq.spawn_condition("erudnext",0,2,0);
			end
		end
	end
end