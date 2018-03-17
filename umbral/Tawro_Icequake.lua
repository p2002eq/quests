-- Tawro Icequake (176006) in Umbral

function event_spawn(e)
	eq.depop_all(176214)
end

function event_death_complete(e)
	local x = e.self:GetSpawnPointX()
	local y = e.self:GetSpawnPointY()
	local z = e.self:GetSpawnPointZ()
	local h = e.self:GetSpawnPointH()
	eq.unique_spawn(176214, 0, 0, x, y, z, h) -- spawn spirit of Tawro
end
