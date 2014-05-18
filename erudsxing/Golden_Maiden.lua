function event_spawn(e)
	local zone_time = eq.get_zone_time(); -- Time here is off by 1, so 6AM = 5.
	local hour = zone_time["zone_hour"] + 1;
	e.self:Shout("I've spawned! Name is: " .. e.self:GetName() .. " Time is: " .. hour ..":00");
end

function event_waypoint_arrive(e)
	-- Qeynos
	if(e.self:GetGrid() == 59 and e.wp == 2) then
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(1,775,260,22,192);
			end,
			function(ent)
				if(ent:GetBoatID() == 773) then
					return true;
				end
				return false;
			end
		);
	-- Erud
	elseif(e.self:GetGrid() == 61 and e.wp == 19) then
		-- This grid zones a few seconds after the other.
		eq.spawn_condition("erudsxing",0,1,0);
		eq.spawn_condition("erudsxing",0,2,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(24,-1606,-584,0,-1);
			end,
			function(ent)
				if(ent:GetBoatID() == 773) then
					return true;
				end
				return false;
			end
		);
	end
end