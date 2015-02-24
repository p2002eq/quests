function event_waypoint_arrive(e)
	if(e.wp == 6) then
		eq.signal(24056,1);
	elseif(e.wp == 7) then
		eq.signal(24056,2);
		eq.signal(24085,1);
	elseif(e.wp == 9) then
		eq.spawn_condition("erudnext",0,1,0);
		eq.spawn_condition("erudnext",0,2,0);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:Signal(1);
			end,
			function(ent)
				-- Server thinks we're on Sabrina and are about to zone.
				if(ent:GetBoatID() == 24056 and ent:GetY() > 500) then
					return true;
				end
				return false;
			end
		);
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(98,2337,418,-22,-1);
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