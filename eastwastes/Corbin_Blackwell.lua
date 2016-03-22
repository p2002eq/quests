function event_waypoint_arrive(e)
    e.self:Say("arrive");
    if (e.wp == 1) then
        e.self:Say("1");
        e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
        eq.spawn2(116569, 0, 0, -2067, 189, 146, 57);
        eq.spawn2(116569, 0, 0, -2067, 199, 146, 57);
        eq.spawn2(116569, 0, 0-2077, 199, 146, 57);
        eq.spawn2(116569, 0, 0, -2077, 189, 146, 57);
        eq.signal(116569, 1161111, 600);
    elseif (e.wp == 2) then
        e.self:Say("2");
        e.self:Say("I'll hack at your knees 'til you fall down! Out of love for the Dain, for the glory of the crown!");
        eq.spawn2(116591, 0, 0, -2819, -296, 149, 40);
        eq.spawn2(116129, 0, 0, -2825, -286, 148, 40);      
        eq.spawn2(116129, 0, 0, -2831, -276, 150, 40);
        eq.spawn2(116129, 0, 0, -2813, -306, 151, 40);
        eq.spawn2(116129, 0, 0, -2807, -316, 151, 40);
        eq.signal(116129, 1161112, 600); 
    elseif (e.wp == 4) then
        e.self:Say("4");
        e.self:Say("I have escaped! With the help of our friends here I was saved from certain death. We are in their debt.");
        eq.signal(116118, 1);
        eq.depop();
    end
end

function event_spawn(e)
    e.self:Say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
    e.self:SetRunning(true);
end