function event_enter_zone(e)
	local sea = eq.get_spawn_condition("qeynos",0,3);
	local golden = eq.get_spawn_condition("qeynos",0,4);
	e.self:Message(0,"Sea King condition is: " .. sea .."");
	e.self:Message(0,"Golden Maiden condition is: " .. golden .."");
		if(e.self:GetBoatID() > 0) then
		e.self:Message(0," BoatID is: " .. e.self:GetBoatID() .. "");
	end
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Message(0," Local time is: " .. hour .. ":00");
	-- We know we can have a boat at 1,5,7, or 11
	if(hour == 1 or hour == 5 or hour == 7 or hour == 11 or
	hour == 13 or hour == 17 or hour == 19 or hour == 23) then
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
		eq.signal(1138,1);
		e.self:Message(0,"My boat is called: " .. e.self:GetBoatName() .. "");
	else
		eq.signal(1138,1);
	end
end

function event_board_boat(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Message(0," At: " .. hour .. ":00 BoatID: " .. e.boat_id .. " was boarded. Its name is: " .. e.self:GetBoatName() .. ".");
end

function event_leave_boat(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Message(0," At: " .. hour .. ":00 I left BoatID: " .. e.boat_id .. ".");
end