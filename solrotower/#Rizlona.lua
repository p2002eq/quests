--#Rizlona
--Dragon Version
--solrotower

function event_death_complete(e)
	eq.spawn2(212068,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());	--A_Planar_Projection (212068)
end