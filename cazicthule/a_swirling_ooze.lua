function event_death_complete(e)
    if (e.self:GetNPCTypeID() == 48302) then -- a swirling ooze
        eq.spawn2(48320,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- a bubbling ooze
    end
end
