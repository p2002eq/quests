function event_waypoint_arrive(e)
    e.self:Say("waypoint arrive");
    if (corbin == 10) then
        e.self:SetRunning(false);
        eq.move_to(-2819, -296, 149);
        e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
        eq.spawn2(116569, 0, 0, -2067, 189, 146, 57);
        eq.spawn2(116569, 0, 0, -2067, 199, 146, 57);
        eq.spawn2(116569, 0, 0, -2077, 199, 146, 57);
        eq.spawn2(116569, 0, 0, -2077, 189, 146, 57);
        eq.signal(116569, 1161111, 600);
        corbin = 20;
    elseif (corbin == 20) then
        eq.move_to(-3178, -531, 150);
        e.self:Say("I'll hack at your knees 'til you fall down! Out of love for the Dain, for the glory of the crown!");
        eq.spawn2(116591, 0, 0, -2819, -296, 149, 40);
        eq.spawn2(116129, 0, 0, -2825, -286, 148, 40);      
        eq.spawn2(116129, 0, 0, -2831, -276, 150, 40);
        eq.spawn2(116129, 0, 0, -2813, -306, 151, 40);
        eq.spawn2(116129, 0, 0, -2807, -316, 151, 40);
        eq.signal(116129, 1161112, 600); 
        corbin = 30;
    elseif (corbin == 30) then
        eq.move_to(-3175, -574.00, 156);
        corbin = 40;
    elseif (corbin == 40) then
        e.self:Say("I have escaped! With the help of our friends here I was saved from certain death. We are in their debt.");
        eq.signal(116118, 1);
        eq.depop();
    end
end
		
function event_trade(e)
    local item_lib = require('items');
    if (item_lib.check_turn_in(e.self, e.trade, {item1 = 1046, item2 = 30162})) then
        e.other:QuestReward(e.self,0,0,0,0,30162,1000);
        e.self:Say("I thought I was a dwarfskin rug there for a minute! Thank Brell for your help stranger! Now cover me while I make good my escape. I am weakened and cannot endure much more.");
        e.self:SetRunning(true);
        eq.move_to(-2012, 197, 148, 40, true);
        corbin = 10;
    end
end