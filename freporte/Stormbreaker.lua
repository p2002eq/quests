function event_waypoint_arrive(e)
	if(e.wp == 8) then
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
		eq.set_global("ootfreeportboat","770",7,"S90");
	end
end