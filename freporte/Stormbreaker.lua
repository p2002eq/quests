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