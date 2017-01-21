function event_say(e)
	if(e.message:findi("hail")) then
		e.self.Say("Salutations to you and your own. On your way to Katta are ya?");
	end
	if(e.message:findi("what armor")) then
		e.self.Say("Frank must have told ya about the soldier's armor that we both keep to give to those worthy of wearing it. I have the mask, cloak, gauntlets, gorget, girdle, and swords.");
	end
	if(e.message:findi("what cloak")) then
		e.self.Say("To get the cloak you will need to get me a meteor jewel, a mark of glory, a ring of wit, and some twilight fish scales.");
	end
	if(e.message:findi("what Gauntlets")) then
		e.self.Say("To get the gauntlets you will need to get me an astral jewel, a mark of opposition, and a hope quartz.");
	end
	if(e.message:findi("what girdle")) then
		e.self.Say("To get the girdle you will need to get me a moon jewel, a mark of contention, a fire scorched stick, and a hope star ruby.");
	end
	if(e.message:findi("what gorget")) then
		e.self.Say("To get the gorget you will need to get me a sun jewel, a mark of pride, and some star dust.");
	end
	if(e.message:findi("what mask")) then
		e.self.Say("To get the mask you will need to get me a sky jewel, a mark of defiance, and a bag of scarlet sand.");
	end
	if(e.message:findi("what sword")) then
		e.self.Say("To get the sword you will need to get me a star jewel, a mark of warfare, a hope fire opal, and some fire powder.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5530, item3 = 5584, 		e.other:SummonItem(3941);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5586, item3 = 5587})) then
		e.other:SummonItem(3942);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5590, item3 = 5591, item4 = 5592})) then
		e.other:SummonItem(3944);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5588, item3 = 5589})) then
		e.other:SummonItem(3943);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5528, item3 = 5529})) then
		e.other:SummonItem(3940);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5668, item3 = 5669, item4 = 5677})) then
		e.other:SummonItem(3945);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
