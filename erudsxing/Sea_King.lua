function event_waypoint_arrive(e)
	-- Qeynos
	if(e.self:GetGrid() == 59 and e.wp == 2) then
		eq.set_timer("1",25000);
	-- Erud
	elseif(e.self:GetGrid() == 61 and e.wp == 19) then
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(24,-1606,-584,0,-1);
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

function event_timer(e)
	if(e.timer == "1") then
		eq.stop_timer("1");
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(1,775,260,22,192);
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