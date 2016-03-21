local corbin = 0;   
local giantsDead = 0;       -- will keep track of giants dead, so we know when to have him continue on after battle with giants
local orcsDead = 0;         -- will keep track of giants dead, so we know when to have him continue on after battle with orcs
--e.self:StopWandering();
--e.self:ResumeWandering();
function event_signal(e)
    if (e.signal == 1) then
        orcsDead = orcsDead + 1;
        if (orcsDead > 3) then
            eq.set_timer("1",10000)
        end
    elseif (e.signal == 2) then
        e.self:Say("giant dead");
        giantsDead = giantsDead + 1;
        if (giantsDead > 4) then
            e.self:Say("set timer giants");
            eq.set_timer("2",10000)
        end
    end
end

function event_combat(e)
    e.self:Say("combat");
    if (e.joined == false) then
        e.self:Say("left combat");
        if (corbin == 10) then
            e.self:Say("move 10");
            eq.move_to(-2012, 197, 148, 190, true);
        elseif (corbin == 20) then
            eq.move_to(-2750, -250, 150, 190, true);
        elseif (corbin == 30) then
            eq.move_to(-3178, -531, 150, 190, true);
        end
    end
end

function event_timer(e)
    if (e.timer == "1") then
        eq.stop_timer("1");
        eq.move_to(-2750, -250, 150, 190, true);
        corbin = 20;
    elseif (e.timer == "2") then
        eq.move_to(-3178, -531, 150, 190, true);
        eq.stop_timer("2");
        corbin = 30;
    end
end

function event_waypoint_arrive(e)
    e.self:Say("waypoint arrive");
    if (corbin == 10) then
        e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
        eq.spawn2(116569, 0, 0, -2067, 189, 146, 57);
        eq.spawn2(116569, 0, 0, -2067, 199, 146, 57);
        eq.spawn2(116569, 0, 0, -2077, 199, 146, 57);
        eq.spawn2(116569, 0, 0, -2077, 189, 146, 57);
        eq.signal(116569, 1161111, 600);
    elseif (corbin == 20) then
        e.self:Say("I'll hack at your knees 'til you fall down! Out of love for the Dain, for the glory of the crown!");
        eq.spawn2(116591, 0, 0, -2819, -296, 149, 40);
        eq.spawn2(116129, 0, 0, -2825, -286, 148, 40);      
        eq.spawn2(116129, 0, 0, -2831, -276, 150, 40);
        eq.spawn2(116129, 0, 0, -2813, -306, 151, 40);
        eq.spawn2(116129, 0, 0, -2807, -316, 151, 40);
        eq.signal(116129, 1161112, 600); 
    elseif (corbin == 30) then
        eq.move_to(-3175, -574.00, 156, 190, true);
        corbin = 40;
    elseif (corbin == 40) then
        e.self:Say("I have escaped! With the help of our friends here I was saved from certain death. We are in their debt.");
        eq.signal(116118, 1);
        eq.depop();
    end
end

function event_spawn(e)
    e.self:Say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
    e.self:SetRunning(true);
    eq.move_to(-2012, 197, 148, 190, true);
    corbin = 10;
end