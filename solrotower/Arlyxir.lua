--Arlyxir (212023)
--solrotower

function event_death_complete(e)
	eq.spawn2(212065,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ()-10, e.self:GetHeading());	--A_Planar_Projection
end