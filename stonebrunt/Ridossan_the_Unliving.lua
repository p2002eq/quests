function event_spawn()
    e.self:SetRunning(true);
    e.self:Shout("I shall have my revenge!!");
    eq.move_to(-615,1210,1028,39.5)
end

function event_waypoint_arrive()
    eq.unique_spawn(100133,0,0,-629,1219,1028,39.5); -- Disciple_Okarote
end