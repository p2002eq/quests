--An_animated_meteor (209156)
--Emmerik_Skyfury  Event (Spawned via A_celestial_portal)
--zone: bothunder

function event_timer(e)
	if e.timer == "depop" and e.self:GetSpawnPointID() == 0 and not e.self:IsEngaged() then
		eq.depop();
	end
end