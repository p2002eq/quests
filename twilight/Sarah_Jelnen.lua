function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Sarah Jelnen closes her eyes and sighs wistfully as if remembering some long forgotten bittersweet memory. 'Hafron must have told you about our dearly missed friend Hadon. Very well, are you a [shaman]?");
	end
	if(e.message:findi("shaman")) then
		e.self:Say("Aye you have the look of one who communes with spirits. The pieces that I have are the [mask], [cloak], [gauntlets], [talisman], [girdle] and [spear].");
	end
	if(e.message:findi("what cloak")) then
		e.self:Say("For the cloak you must get me a cloud jewel, mark of auspice, an avatar's tome, and a rockhopper spirit fetish.");
	end
	if(e.message:findi("what gauntlets")) then
		e.self:Say("For the gauntlets you must get me a sky jewel, a mark of guidance, and a vitality gem.");
	end
	if(e.message:findi("what girdle")) then
		e.self:Say("For the girdle you must get me an astral jewel, a mark of augury, an aged runic crutch, and a lined towel.");
	end
	if(e.message:findi("what mask")) then
		e.self:Say("For the mask you must get me a star jewel, the mark of the oracle, and an aged bone fetish.");
	end
	if(e.message:findi("what spear")) then
		e.self:Say("For the spear you must get me a sun jewel, a mark of premonition, a darkened shaft, and an oracle orb.");
	end
	if(e.message:findi("what talisman")) then
		e.self:Say("For the talisman you must get me a meteor jewel, a mark of rage, and a spirit marked ornament.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4940, item3 = 4949, item4 = 4950})) then
		e.other:SummonItem(3757);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4992, item2 = 4951, item3 = 4952})) then
		e.other:SummonItem(3758);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4994, item2 = 4955, item3 = 4956, item4 = 4957})) then
		e.other:SummonItem(3760);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4938, item3 = 4939})) then
		e.other:SummonItem(3756);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4959, item3 = 4960})) then
		e.other:SummonItem(3761);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4953, item3 = 4954})) then
		e.other:SummonItem(3759);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
