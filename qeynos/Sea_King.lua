function event_waypoint_arrive(e)
	if(e.wp == 11) then
		eq.spawn_condition("qeynos",0,3,0);
		eq.spawn_condition("qeynos",0,4,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(98,-2190,-464,-22,64);
			end,
			function(ent)
				if(ent:GetBoatID() == 772) then
					return true;
				end
				return false;
			end
		);
	end
end