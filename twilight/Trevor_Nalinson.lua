function event_say(e)
	if(e.message:findi("None")) then
		e.self.Say("Can't ya see I'm busy working.  Leave me be.");
	end
	if(e.message:findi("None")) then
		e.self.Say("Bah, Brodlan should know better than opening his big mouth. Anyway this looks like armor for a dark knight if ye want to trade for it.");
	end
	if(e.message:findi("None")) then
		e.self.Say("Good ya want to trade. I have the mask, cloak, gauntlets, gorget, girdle, and mace. Just tell me what piece you want to trade for and Ill tell ya what I want.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the darkened knight's cloak you'll have to bring me a cloud jewel, a mark of twisted souls, a chilled brazier, and a gem of blue skies.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the darkened knight's gauntlets you'll have bring me a sky jewel, a mark of fright, and a true silver idol");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the darkened knight's girdle you'll have to bring me an astral jewel, a mark of gloom, some gilded beads, and an etched tablet.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the darkened knigh's gorget you'll have to bring me a meteor jewel, a mark of darkness, a runed stone brazier.");
	end
	if(e.message:findi("None")) then
		e.self.Say("For the darkened knight's mace you'll have to bring me a sun jewel, a mark of night, a beaded circlet, and a heating stone.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5875, item3 = 5876, item4 = 5877})) then
		e.other:SummonItem(3967);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5880, item3 = 5881})) then
		e.other:SummonItem(3969);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5878, item3 = 5879})) then
		e.other:SummonItem(3968);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5882, item3 = 5883, item4 = 5884})) then
		e.other:SummonItem(3970);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5885, item3 = 5886, item4 = 5887})) then
		e.other:SummonItem(3971);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
