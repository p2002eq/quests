--a_Stampeding_Boar (214290)
function event_spawn(e)
	e.self:SetRunning(true);
end

function event_waypoint_arrive(e)
	if (e.wp == 6) then
		eq.depop();
	end
end
