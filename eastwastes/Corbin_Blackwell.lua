-- Corbin Blackwell. This version spawns upon handin of key+ring to the version spawned in the wild

function event_waypoint_arrive(e) -- this deviates slightly from the original version. The orcs and giants spawn in separate waves, but they spawn on top of him preventing kiting/pulling away
    if (e.wp == 1) then
        e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
        eq.spawn2(116569, 0, 0, -2027, 149, 150,114.0); -- Ry`Gorr Basher
        eq.spawn2(116569, 0, 0, -2027, 159, 150,114.0); -- Ry`Gorr Basher
        eq.spawn2(116569, 0, 0, -2037, 159, 150,114.0); -- Ry`Gorr Basher
        eq.spawn2(116569, 0, 0, -2037, 149, 150,114.0); -- Ry`Gorr Basher
        eq.signal(116569, 1161111, 600); -- Ry`Gorr Basher
    elseif (e.wp == 2) then
        e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
        eq.spawn2(116591, 0, 0, -2819, -296, 149,80.0); -- Commander Bahreck
        eq.spawn2(116129, 0, 0, -2825, -286, 148,80.0); -- Kromrif Soldier
        eq.spawn2(116129, 0, 0, -2831, -276, 150,80.0); -- Kromrif Soldier
        eq.spawn2(116129, 0, 0, -2813, -306, 151,80.0); -- Kromrif Soldier
        eq.spawn2(116129, 0, 0, -2807, -316, 151,80.0); -- Kromrif Soldier
        eq.signal(116129, 1161112, 600); -- Kromrif Soldier
    elseif (e.wp == 4) then
        e.self:Say("I have escaped! With the help of our friends here I was saved from certain death. We are in their debt.");
        eq.signal(116118, 1);
        eq.set_timer("depop",1000);
    end
end

function event_combat(e)
	if e.joined then
		e.self:Say("I'll hack at your knees 'til you fall down! Out of love for the Dain, for the glory of the crown!");
	end
end

function event_spawn(e)
    e.self:AssignWaypoints(276);
    e.self:Say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
end

function event_timer(e)
    if (e.timer == "depop") then
        eq.depop();
    end
end
