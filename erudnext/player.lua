function event_enter_zone(e)
	entity_list = eq.get_entity_list();
	if(e.self:GetBoatID() == 772 and entity_list:IsMobSpawnedByNpcTypeID(772) == false) then
		eq.spawn_condition("erudnext",0,1,1);
	elseif(e.self:GetBoatID() == 773 and entity_list:IsMobSpawnedByNpcTypeID(773) == false) then
		eq.spawn_condition("erudnext",0,2,1);
	end
	e.self:Message(0," BoatID is: " .. e.self:GetBoatID() .. "");
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Message(0," Local time is: " .. hour .. ":00");
	-- We know we can have a boat at 1,4,5,8,9,or 12
	if(hour == 1 or hour == 9 or hour == 5 or hour == 4 or hour == 12 or hour == 8 or
	hour == 13 or hour == 21 or hour == 17 or hour == 16 or hour == 24 or hour == 20) then
		e.self:Message(0,"A boat *might* be spawned!");
	end
	if(entity_list:IsMobSpawnedByNpcTypeID(772) == true) then
		local seaking = entity_list:GetMobByNpcTypeID(772);
		e.self:Message(0,"Sea King is spawned! Name is: " .. seaking:GetName() .. "");
	end
	if(entity_list:IsMobSpawnedByNpcTypeID(773) == true) then
		local goldenmaiden = entity_list:GetMobByNpcTypeID(773);
		e.self:Message(0,"Golden Maiden is spawned! Name is: " .. goldenmaiden:GetName() .. "");
	end
	if(e.self:GetBoatID() == 772 or e.self:GetBoatID() == 773) then
		eq.signal(24056,3);
		e.self:Message(0,"My boat is called: " .. e.self:GetBoatName() .. "");
	else
		eq.signal(24056,4);
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:SetBoatID(772);
		e.self:SetBoatName("Sea_King000");
	elseif(e.signal == 2) then 
		e.self:SetBoatID(773);
		e.self:SetBoatName("Golden_Maiden000");
	end
end