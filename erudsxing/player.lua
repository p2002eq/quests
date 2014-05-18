function event_enter_zone(e)
	e.self:Message(0," BoatID is: " .. e.self:GetBoatID() .. "");
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Message(0," Local time is: " .. hour .. ":00");
	-- We know we can have a boat at 1,2,5,6,9, or 10
	if(hour == 1 or hour == 2 or hour == 5 or hour == 6 or hour == 9 or hour == 10 or
	hour == 13 or hour == 14 or hour == 17 or hour == 18 or hour == 21 or hour == 22) then
		e.self:Message(0,"A boat *might* be spawned!");
	end
	entity_list = eq.get_entity_list();
	if(entity_list:IsMobSpawnedByNpcTypeID(772) == true) then
		local seaking = entity_list:GetMobByNpcTypeID(772);
		e.self:Message(0,"Sea King is spawned! Name is: " .. seaking:GetName() .. "");
	end
	if(entity_list:IsMobSpawnedByNpcTypeID(773) == true) then
		local goldenmaiden = entity_list:GetMobByNpcTypeID(773);
		e.self:Message(0,"Golden Maiden is spawned! Name is: " .. goldenmaiden:GetName() .. "");
	end	
	if(e.self:GetBoatID() == 772 or e.self:GetBoatID() == 773) then
		eq.signal(98036,1);
		e.self:Message(0,"My boat is called: " .. e.self:GetBoatName() .. "");
	else
		eq.signal(98036,2);
	end
end
