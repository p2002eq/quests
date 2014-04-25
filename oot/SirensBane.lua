function event_waypoint_arrive(e)
	-- Freeport
	if(e.self:GetGrid() == 60 and e.wp == 17) then
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(10,-1853,-748,-80,0);
			end,
			function(ent)
				if(ent:GetBoatID() == 771) then
					return true;
				end
				return false;
			end
		);
		eq.set_global("freeportboat","771",7,"S90");
	-- Butcher
	elseif(e.self:GetGrid() == 61 and e.wp == 15) then
		eq.get_entity_list():ForeachClient(
			function(ent)
				ent:MovePC(68,4591,2090,-15,0);
			end,
			function(ent)
				if(ent:GetBoatID() == 771) then
					return true;
				end
				return false;
			end
		);
		eq.set_global("butcherboat","771",7,"S90");
	end
end

function event_signal(e)
	e.self:PauseWandering(0);
	if(e.signal == 1) then
		e.self:SetCurrentWP(14);
		e.self:ResumeWandering();
	elseif(e.signal == 2) then
		e.self:SetCurrentWP(15);
		e.self:ResumeWandering();
	end
end