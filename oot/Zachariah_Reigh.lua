function event_spawn(e)
	eq.spawn_condition("oot",0,1,0);
	eq.spawn_condition("oot",0,2,0);
end

function event_signal(e)
	e.self:Shout("Signal recieved!");
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.	
	local hour = zone_time["zone_hour"] + 1;
	entity_list = eq.get_entity_list();
	local count = eq.get_entity_list():CountClient();
	if(count == 1) then
		-- Let spawn_event handle things which is 7:00 or 1:00
		if(hour ~= 7 and hour ~= 19 and hour ~= 1 and hour ~= 13) then
			eq.spawn_condition("oot",0,1,0);
			eq.spawn_condition("oot",0,2,0);
			e.self:Shout("Reset spawn condition!");
		end
		if(e.signal == 1) then
			if(hour == 7 or hour == 19 or hour == 1 or hour == 13) then
				e.self:Shout("OOT: Letting spawn_events handle condition!");
			-- We have enough time left to use the normal condition 8:00 or 2:00
			elseif(hour == 8 or hour == 20) then
				eq.spawn_condition("oot",0,1,1);
				e.self:Shout("OOT: Condition 1 set.");
			elseif(hour == 2 or hour == 14) then
				eq.spawn_condition("oot",0,2,1);
				e.self:Shout("OOT: Condition 2 set.");
			-- Spawn the boats midway and let them path from there. 9:00 to 10:00 or 3:00 to 4:00
			elseif(hour == 9 or hour == 10 or hour == 21 or hour == 22) then
				if(entity_list:IsMobSpawnedByNpcTypeID(770) == false or entity_list:IsMobSpawnedByNpcTypeID(771) == false) then
					eq.unique_spawn(770,61,0,3116,-1756,-20,-1);
					eq.signal(770,1);
					eq.unique_spawn(771,60,0,-5750,-4650,-20,-1);
					eq.signal(771,1);
					e.self:Shout("OOT: Spawning midway config 1.");
				else
					e.self:Shout("OOT: Midway spawning failed!");
				end
			elseif(hour == 3 or hour == 4 or hour == 15 or hour == 16) then
				if(entity_list:IsMobSpawnedByNpcTypeID(770) == false or entity_list:IsMobSpawnedByNpcTypeID(771) == false) then
					eq.unique_spawn(771,61,0,3316,-1756,-20,-1);
					eq.signal(770,2);
					eq.unique_spawn(770,60,0,-5750,-4650,-20,-1);
					eq.signal(771,2);
					e.self:Shout("OOT: Spawning midway config 2.");
				else
					e.self:Shout("OOT: Midway spawning failed!");
				end
			else
				e.self:Shout("Sorry, you missed the boat and should be at safe coords.");
			end
			e.self:Shout("We should be spawned. If no condition message, we are missing logic.");
		end
	else
		-- If there is already a player in the zone, the only time we should be without a boat is the last 2 hours of the cycle.
		if(e.signal == 1) then
			if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(770) == false and 
			eq.get_entity_list():IsMobSpawnedByNpcTypeID(771) == false) then
				e.self:Shout("Sorry, you missed the boat and should be at safe coords.");
			else
				e.self:Shout("Boat was already spawned for us.");
			end
		end
	end
			
end