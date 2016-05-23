function event_death_complete(e)
    e.self:Say("test death");
    if (e.self:GetNPCTypeID() == 48302) then
        e.self:Say("right npc ");
        eq.spawn2(48320,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
    end
end