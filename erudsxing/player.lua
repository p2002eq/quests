function event_enter_zone(e)
	local sea = eq.get_spawn_condition("erudsxing",0,1);
	local seaa = eq.get_spawn_condition("erudsxing",0,3);
	local golden = eq.get_spawn_condition("erudsxing",0,4);
	local goldena = eq.get_spawn_condition("erudsxing",0,2);
	e.self:Message(0,"Sea King Qeynos condition is: " .. sea .." Sea King Erud condition is: " .. seaa .."");
	e.self:Message(0,"Golden Maiden Qeynos condition is: " .. golden .." Golden Maiden Erud condition is: " .. goldena .."");
	if(e.self:GetBoatID() > 0) then
		e.self:Message(0," BoatID is: " .. e.self:GetBoatID() .. "");
	end
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Message(0," Local time is: " .. hour .. ":00");
	-- We know we can have a boat at 2,4,6,8,10, or 12
	if(hour == 2 or hour == 4 or hour == 6 or hour == 8 or hour == 10 or hour == 12 or
	hour == 14 or hour == 16 or hour == 18 or hour == 20 or hour == 22 or hour == 24) then
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