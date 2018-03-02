-- This is to spawn a lesser spirit upon Blinde's death for Shaman epic 1.0
function event_death_complete(e)
	eq.spawn2(50306,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end