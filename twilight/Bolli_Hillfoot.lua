function event_say(e)
	if(e.message:findi("what boots")) then
		e.self.Say("If you want the Boots of Concealment go gather for me a meteor jewel, a mark of silence, and an engraved fire emerald statuette.");
	end
	if(e.message:findi("what bracer")) then
		e.self.Say("If you want the Bracer of Concealment go gather for me a sky jewel, a mark of cunning, and an engraved black diamond statuette.");
	end
	if(e.message:findi("what tunic")) then
		e.self.Say("If you want the Tunic of Concealment go gather for me a sun jewel, a mark of stealth, an engraved diamond statuette, and a tethered leash.");
	end
	if(e.message:findi("what greaves")) then
		e.self.Say("If you want the Greaves of Concealment go gather for me a star jewel, a mark of burglary, an engraved ruby statuette, and a small brass figurine.");
	end
	if(e.message:findi("what deals")) then
		e.self.Say("Ah $nameyou fancy yerself to be a rogue.  Well I can cut ya a deal on some armor if you be wantin' some.");
	end
	if(e.message:findi("what coif")) then
		e.self.Say("If you want the Coif of Concealment go gather for me an astral jewel, a mark of thievery, an engraved sapphire statuette, and a brass linked chain.");
	end
	if(e.message:findi("what mantle")) then
		e.self.Say("If you want the Mantle of Concealment go gather for me a cloud jewel, a mark of forgery, and an engraved star sapphire statuette.");
	end
	if(e.message:findi("vambraces")) then
		e.self.Say("If you want the Vambraces of Concealment go gather for me a moon jewel, a mark of robbery, an engraved emerald statuette, and a half melted blade.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5285, item3 = 5286})) then
		e.other:SummonItem(3794);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5283, item3 = 5284})) then
		e.other:SummonItem(3793);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5296, item3 = 5273, item4 = 5274})) then
		e.other:SummonItem(3789);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5278, item3 = 5279, item4 = 5280})) then
		e.other:SummonItem(3791);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5269, item3 = 5270, item4 = 5271})) then
		e.other:SummonItem(3788);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5281, item3 = 5282})) then
		e.other:SummonItem(3792);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5275, item3 = 5276, item4 = 5277})) then
		e.other:SummonItem(3790);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
