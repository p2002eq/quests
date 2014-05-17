function event_spawn(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Shout("I've spawned! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":00");
end

function event_waypoint_arrive(e)
	if(e.wp == 8) then
		eq.spawn_condition("freporte",0,3,0);
		eq.spawn_condition("freporte",0,4,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(69,-10607,-2995,20,0);
			end,
			function(ent)
			 	if(ent:GetBoatID() == 770) then
					return true;
				end
				return false;
			end
		);
	end
end