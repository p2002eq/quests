--A_firestorm_elemental (209005)
--Evynd_Firestorm Event (Spawned via a firestorm portal)
--zone: bothunder

function event_timer(e)
	if e.timer == "depop" and e.self:GetSpawnPointID() == 0 and not e.self:IsEngaged() then
		eq.depop();
	end
end