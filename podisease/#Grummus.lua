--Grummus (205091)
--podisease


function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,250,"The room shakes and trembles as Grummus' massive body falls to the ground.")
	eq.spawn2(205157,0,0,e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());	--Planar Projection
end

