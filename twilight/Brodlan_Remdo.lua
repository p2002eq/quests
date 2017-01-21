function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why hello. I'm in charge of the fishing operations here on Jern's Isle.  [Fish] are my area of expertise.'");
	end
	if(e.message:findi("what fish")) then
		e.self:Say("We have fish come in here all the time. Sometimes we catch an [oddity] now and again.");
	end
	if(e.message:findi("what oddity")) then
		e.self:Say("Once we pulled up this ancient chest filled with this [dark plate armor].");
	end
	if(e.message:findi("what dark plate armor")) then
		e.self:Say("Looked the like kind of armor a dark knight would wear. if ya want it I'm sure we could arrange a [trade] of some sort.");
	end
	if(e.message:findi("what trade")) then
		e.self:Say("Since Trevor and I are the ones that found it we split it between ourselves. I have a [helm], [breastplate], [vambraces], [greaves], [pauldrons], [bracer], and [boots]. Ask Trevor about the rest of the armor.");
	end
	if(e.message:findi("what breastplate")) then
		e.self:Say("For the darkened knight's breastplate fetch me a cloud jewel. a mark of fear. a delicate glass sculpture. and a painted ornament.");
	end
	if(e.message:findi("what vambracers")) then
		e.self:Say("For the darkened knight's vambraces fetch me a sky jewel. a mark of terror. a runed ornamental mace. and an ancient tablet.");
	end
	if(e.message:findi("what greaves")) then
		e.self:Say("For the darkened knight's greaves fetch me a meteor jewel. a mark of dread. the King's Tome. and a polished ivory idol.");
	end
	if(e.message:findi("what pauldrons")) then
		e.self:Say("For the darkened knight's pauldrons fetch me an astral jewel. a mark of hatred. and an ancient petrified tulip.");
	end
	if(e.message:findi("what bracer")) then
		e.self:Say("For the darkened knight's bracer fetch me a sun jewel. a mark of intimidation. and a small rough marble figurine.");
	end
	if(e.message:findi("what boots")) then
		e.self:Say("For the darkened knight's boots fetch me a moon jewel. a mark of horror. and a fanged talisman.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5871, item3 = 5872})) then
		e.other:SummonItem(3965);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5869, item3 = 5870})) then
		e.other:SummonItem(3964);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5857, item3 = 5860, item4 = 5859})) then
		e.other:SummonItem(3960);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5864, item3 = 5865, item4 = 5866})) then
		e.other:SummonItem(3962);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5854, item3 = 5855, item4 = 5856})) then
		e.other:SummonItem(3959);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5873, item3 = 5874})) then
		e.other:SummonItem(3966);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5867, item3 = 5868})) then
		e.other:SummonItem(3963);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5861, item3 = 5862, item4 = 5863})) then
		e.other:SummonItem(3961);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
