function event_death_complete(e)
    e.self:Say(.. e.self:GetNPCTypeID() ..);
    if (e.self:GetNPCTypeID() == 48302) then
        eq.spawn2(48320,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
    end
end