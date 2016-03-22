function event_spawn(e)
    e.self:SetRunning(true);
    e.self:Say("spawned");
end


function event_waypoint_arrive(e)
    e.self:Say("way point arrive");
    if (e.wp == 1) then
        e.self:Say("wp 1");
        eq.spawn2(116569, 0, 0, -78, 192, 35.8, 57);
    elseif (e.wp == 2) then
        e.self:Say("wp 2");
    end
end