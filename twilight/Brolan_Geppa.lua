function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Well met friend lovely day isn't it?");
	end
	if(e.message:findi("What armor")) then
		e.self:Say("Yes Shelia told me I may have some people asking me about the armor I have. Are ya a bard?");
	end
	if(e.message:findi("I am a bard.")) then
		e.self:Say("Good, I have a [mask], [cloak], [gauntlets], [gorget], [girdle], and a [sword].");
	end
	if(e.message:findi("cloak")) then
		e.self:Say("For the cloak you must gather these things. An Astral jewel, a mark of melody, an onyx studded medal, and a porous rock.");
	end
	if(e.message:findi("gauntlets")) then
		e.self:Say("For the gauntlets you must gather these things. A sun jewel, a mark of anthems, and a fire emerald studded medal.");
	end
	if(e.message:findi("girdle")) then
		e.self:Say("For the girdle you must gather these things. A star jewel, a mark of composition, a peridot studded medal, and a seared brand.");
	end
	if(e.message:findi("gorget")) then
		e.self:Say("For the gorget you must gather these things a moon jewel, a mark of psalms, and a black pearl studded medal.");
	end
	if(e.message:findi("mask")) then
		e.self:Say("For the mask you must gather these things a meteor jewel, a mark of tenor, and a star sapphire studded medal.");
	end
	if(e.message:findi("sword")) then
		e.self:Say("For the sword you must gather these things a cloud jewel, a mark of chants, a red stone idol, and a moonstone studded medal.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5393, item3 = 5394, item4 = 5395})) then
		e.other:SummonItem(3928);
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:AddEXP(50000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5397, item2 = 5396, item3 = 4488})) then
		e.other:SummonItem(3929);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5474, item2 = 5475, item3 = 5476, item4 = 4490})) then
		e.other:SummonItem(3931);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5399, item2 = 5398, item3 = 4489})) then
		e.other:SummonItem(3930);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5349, item2 = 4493, item3 = 5354})) then
		e.other:SummonItem(3910);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5477, item3 = 5479, item4 = 5478})) then
		e.other:SummonItem(3932);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
