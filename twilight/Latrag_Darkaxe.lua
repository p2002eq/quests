function event_say(e)
	if(e.message:findi("Hail")) then
		e.self.Say("Har there lad! Ye be sure 'nuff to tell em all that Brewmaster Latrag is [retiring].");
	end
	if(e.message:findi("retiring")) then
		e.self.Say("Ya got that right. I'm goin' to concentrate more on me devotion to Brell as a [holy knight]!");
	end
	if(e.message:findi("holy knoght")) then
		e.self.Say("I be a paladin of Brell thar Daias . Might ye be a [paladin] yerself?");
	end
	if(e.message:findi("paladin")) then
		e.self.Say("That's good. Ya know I have some armor ye might be interested in.");
	end
	if(e.message:findi("what armor")) then
		e.self.Say("Yar! I have me a [helm], [breastplate], [vambraces], [greaves], [pauldrons], and a [bracer]. If ye want the rest talk to the mighty holy warrior Trallen over there about armor.");
	end
	if(e.message:findi("what breastplate")) then
		e.self.Say("For the breastplate ye gotta bring me a star jewel, a mark of courage, a white marble bowl, and a jagged reed.");
	end
	if(e.message:findi("what vambracers")) then
		e.self.Say("For the vambraces ye gotta bring me a cloud jewel, a mark of righteousness, a runed card, and a pristine ebony idol");
	end
	if(e.message:findi("what greaves")) then
		e.self.Say("For the greaves ye gotta bring me a sky jewel, a mark of bravery, a sunflower fruit, and a weathered bundle of wood");
	end
	if(e.message:findi("what pauldrons")) then
		e.self.Say("For the pauldrons ye gotta bring me a meteor jewel, a mark of daring, and a life gem.");
	end
	if(e.message:findi("what bracer")) then
		e.self.Say("For the bracer ye gotta bring me an astral jewel, a mark of reliance, and some blessed water");
	end
	if(e.message:findi("what helm")) then
		e.self.Say("For the helm ye gotta bring me a moon jewel, a mark of valor, a withered branch, and a pale pearl.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5902, item3 = 5903})) then
		e.other:SummonItem(3977);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5891, item3 = 5892, item4 = 5983})) then
		e.other:SummonItem(3973);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5897, item3 = 5898, item4 = 5899})) then
		e.other:SummonItem(3975);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5888, item3 = 5889, item4 = 5890})) then
		e.other:SummonItem(3972);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5900, item3 = 5901})) then
		e.other:SummonItem(3976);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5894, item3 = 5895, item4 = 5896})) then
		e.other:SummonItem(3974);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
