function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("You must have been speaking to Derron, a mightier cleric ye couldnt find. Except for Donal the Wise of course. So tell me are ye also a cleric like Derron?");
	end
	if(e.message:findi("I am a cleric")) then
		e.self:Say("Ah then you must want the mask, cloak, gauntlets, talisman, girdle, and hammer that I be holdin'.");
	end
	if(e.message:findi("cloak")) then
		e.self:Say("To get the cloak you must bring me a sky jewel, a mark of credence, a light etched fire opal, and a polished stone statuette.");
	end
	if(e.message:findi("gauntlets")) then
		e.self:Say("To get the gauntlets you must bring me a meteor jewel, a mark of piety, and a light etched opal.");
	end
	if(e.message:findi("girdle")) then
		e.self:Say("To get the girdle you must bring me a sun jewel, a mark of grace, a light etched diamond, and a dark eyed iris.");
	end
	if(e.message:findi("hammer")) then
		e.self:Say("To get the hammer you must bring me a moon jewel, a mark of salvation, a light etched emerald, and the writ of distance.");
	end
	if(e.message:findi("mask")) then
		e.self:Say("To get the mask you must bring me a cloud jewel, a mark of hope, and a light etched star ruby.");
	end
	if(e.message:findi("talisman")) then
		e.self:Say("To get the talisman you must bring me an astral jewel, a mark of affirmation, and a light etched peridot.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4850, item3 = 4858, item4 = 4859})) then
		e.other:SummonItem(3744);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4860, item3 = 4868})) then
		e.other:SummonItem(3745);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4878, item3 = 4879, item4 = 4880})) then
		e.other:SummonItem(3747);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4888, item3 = 4889, item4 = 4890})) then
		e.other:SummonItem(3748);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4848, item3 = 4849})) then
		e.other:SummonItem(3743);
		e.other:AddEXP(10000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4869, item3 = 4870})) then
		e.other:SummonItem(3746);
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
