function event_spawn(event)
    local xloc = event.self:GetX();
    local yloc = event.self:GetY();
    local zloc = event.self:GetZ();
    eq.set_proximity(xloc - 45, xloc + 45, yloc - 45, yloc + 45, zloc - 45, zloc + 45);
end

function event_enter(event)
    eq.spawn2(123243,0,0,event.self:GetX(),event.self:GetY(),event.self:GetZ(),event.self:GetHeading());
    eq.depop_with_timer();
end