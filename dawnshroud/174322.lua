---- Quest:Hunter's Pike

function event_death_complete(e)
    eq.spawn2(174324,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- A_Rabid_Beast
end
