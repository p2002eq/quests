function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh hello there, I'm in charge of the docks here and wife to Alton.");
	end
	if(e.message:findi("ranger")) then
		e.self:Say("Very well. If you want the Woodsman's [Mantle], Woodsman's [Mask], Woodsman's [Cape], Woodsman's [Guantlets], Woodsman's [Choker], or Woodsman's [Belt] I have some errands that need to be done.");
	end
	if(e.message:findi("armor")) then
		e.self:Say("Oh you wish to get the armor that Alton's great granddaddy used to wear. If you are a ranger just let me know.");
	end
	if(e.message:findi("belt")) then
		e.self:Say("If you want the Woodsman's Belt bring me a moon jewel, a mark of the environment, a gold pointer, and a broken ancient blade.");
	end
	if(e.message:findi("cape")) then
		e.self:Say("If you want the Woodsman's Cape bring me a sky jewel, a mark of creatures, a wondrous stone, and a marble statuette.");
	end
	if(e.message:findi("choker")) then
		e.self:Say("If you want the Woodsman's Choker bring me an astral jewel, a mark of ambidexterity, and a small ancient sculpture.");
	end
	if(e.message:findi("gauntlets")) then
		e.self:Say("If you want the Woodsman's Guantlets bring me a meteor jewel, a mark of animals, and a tattered old card.");
	end
	if(e.message:findi("mantle")) then
		e.self:Say("If you want the Woodsman's Mantle bring me a sun jewel, a mark of rivers, and a temporal sack.");
	end
	if(e.message:findi("mask")) then
		e.self:Say("If you want the Woodsman's Mask bring me a cloud jewel, a mark of stone, and a platinum chain.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5850, item2 = 5849, item3 = 5848, item4 = 4489})) then
		e.other:SummonItem(3957);
		e.self:Emote("smiles at you.");
		e.self:Say("Thank You! Here is your payment.");
		e.other:AddEXP(25000);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5844, item2 = 5698, item3 = 4492, item4 = 5699})) then
		e.other:SummonItem(3954);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5981, item3 = 5847})) then
		e.other:SummonItem(3956);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5845, item2 = 4493, item3 = 5846})) then
		e.other:SummonItem(3955);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5690, item2 = 4488, item3 = 5691})) then
		e.other:SummonItem(3950);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5696, item3 = 5697})) then
		e.other:SummonItem(3953);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
