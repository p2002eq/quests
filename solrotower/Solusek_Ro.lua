--Solusek_Ro (212025)
--solrotower

function event_death_complete(e)
	eq.spawn2(212070,0,0, e.self:GetX(), e.self:GetY(), e.self:GetZ() - 15, e.self:GetHeading());	--A_Planar_Projection (212070)
end