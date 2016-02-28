local corbin = 0;

function event_say(e)
    if(e.message:findi("orc")) then
            e.self:Say("orc");
--        eq.spawn2(116569, 0, 0, -2067, 189, 146, 57):AddToHateList(e.self,1);
    end
end

function event_signal(e)
	if (e.signal = 1161111) then
        eq.move_to(-3183, -586, 188);
        corbin = 20;
    end
end

function event_waypoint_depart(e)
	if (corbin == 10) then
	    e.self:Say("Uh oh, looks like they were tipped off somehow... I hope you can handle them.");
	    eq.spawn2(116569, 0, 0, -2067, 189, 146, 57);
	    eq.spawn2(116569, 0, 0, -2067, 199, 146, 57);
	    eq.spawn2(116569, 0, 0, -2077, 199, 146, 57);
	    eq.spawn2(116569, 0, 0, -2077, 189, 146, 57);
	elseif (corbin == 20) then
	    e.self:Say("I'll hack at your knees 'til you fall down! Out of love for the Dain, for the glory of the crown!");
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