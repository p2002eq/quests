function event_waypoint_arrive(e)
	if(e.wp == 6) then
		eq.spawn_condition("butcher",0,1,0);
		eq.spawn_condition("butcher",0,2,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(69,10944,1236,-20,0);
			end,
			function(ent)
			 	if(ent:GetBoatID() == 771) then
					return true;
				end
				return false;
			end
		);
	end
end