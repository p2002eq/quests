-- Radir Fireshower (176212) in Umbral

function event_death_complete(e)
	local x = e.self:GetSpawnPointX()
	local y = e.self:GetSpawnPointY()
	local z = e.self:GetSpawnPointZ()
	local h = e.self:GetSpawnPointH()
	eq.unique_spawn(176213, 0, 0, x, y, z, h) -- spawn spirit of Radir
end
