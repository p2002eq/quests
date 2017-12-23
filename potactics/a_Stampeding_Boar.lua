-- NPCID: 214097 a_Stampeding_Boar
function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	if (e.wp == 6) then
		eq.depop();
	end
end
