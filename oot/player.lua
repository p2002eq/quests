function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	if(qglobals.strongbox ~= nil) then
		eq.CreateGroundObject(13860, -9200, -430, -293, 0, 3000000);
		eq.delete_global("strongbox");
	end
	
	e.self:Message(0," BoatID is: " .. e.self:GetBoatID() .. "");
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Message(0," Local time is: " .. hour .. ":00");
	if(hour == 7 or hour == 19 or hour == 1 or hour == 13) then
		e.self:Message(0,"A boat should be spawned!");
		entity_list = eq.get_entity_list();
		if(entity_list:IsMobSpawnedByNpcTypeID(770) == true) then
			local stormbreaker = entity_list:GetMobByNpcTypeID(770);
			e.self:Message(0,"Stormbreaker is spawned! Name is: " .. stormbreaker:GetName() .. "");
		end
		if(entity_list:IsMobSpawnedByNpcTypeID(771) == true) then
			local sirensbane = entity_list:GetMobByNpcTypeID(771);
			e.self:Message(0,"SirensBane is spawned! Name is: " .. sirensbane:GetName() .. "");
		end	
	end
	if(e.self:GetBoatID() == 770 or e.self:GetBoatID() == 771) then
		eq.signal(69078,1);
		e.self:Message(0,"My boat is called: " .. e.self:GetBoatName() .. "");
	else
		eq.signal(69078,2);
	end
end

			