-- Radir Fireshower (176212) in Umbral

function event_spawn(e)
	local x = e.self:GetSpawnPointX()
	local y = e.self:GetSpawnPointX()
	local z = e.self:GetSpawnPointX()
	local h = e.self:GetSpawnPointX()
	e.self:Shout('Coords are ' .. x .. ', ' .. y .. ', ' .. z .. ', ' .. h)
	e.self:Shout('Respawn is ' .. eq.get_entity_list():GetSpawnByID(e.self:GetSpawnPointID()):RespawnTimer())
end

function event_death_complete(e)
	eq.unique_spawn(176213, 0, 0, -2036, -764, -17)
end
