local corbin = 0;

function event_signal(e)
    if (e.signal == 1161111) then
        eq.move_to(-2750, -250, 150);
        corbin = 20;
    elseif (e.signal == 1161112) then
        eq.move_to(-3188, -574, 1);
        corbin = 30;
    end
end

function event_waypoint_depart(e)
    if (corbin == 10) then
        e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
        eq.spawn2(116569, 0, 0, -2067, 189, 146, 57);
        eq.spawn2(116569, 0, 0, -2067, 199, 146, 57);
        eq.spawn2(116569, 0, 0, -2077, 199, 146, 57);
        eq.spawn2(116569, 0, 0, -2077, 189, 146, 57);
        eq.signal(116569, 1161111, 400); 
    elseif (corbin == 20)
        e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
        eq.spawn2(116591, 0, 0, -2819, -296, 149, 40);
        eq.spawn2(116129, 0, 0, -2825, -286, 148, 40)        eq.spawn2(116129, 0, 0, -2831, -276, 150, 40);
        eq.spawn2(116129, 0, 0, -2837, -266, 151, 40);
        eq.spawn2(116129, 0, 0, -2843, -256, 151, 40);
        eq.signal(116129, 1161112, 400); 
    elseif (corbin == 30)
    end
end
		
function event_trade(e)
    local item_lib = require('items');
    if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1046, item2 = 30162})) then
        e.other:QuestReward(e.self,0,0,0,0,30162,1000);
        e.self:Say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
        eq.move_to(-2012, 197, 148, 270, true);
        corbin = 10;
    end
end