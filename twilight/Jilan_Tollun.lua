function event_say(e)
	if(e.message:findi("Hail")) then
		e.self.Say("Hello there. please leave me alone I would like some peace and quiet.'");
	end
	if(e.message:findi("armor")) then
		e.self.Say("amben must have told you about the old beastlord we came upon. So tell me are you a worthy beastlord?");
	end
	if(e.message:findi("worthy beastlord")) then
		e.self.Say("Then you must want the armor I have. I have the veil, cape, gloves, talisman, belt, and claws.");
	end
	if(e.message:findi("belt")) then
		e.self.Say("For the belt you must bring me a sky jewel, a mark of the wolf, an embedded steel figurine, and ancient wrappings.");
	end
	if(e.message:findi("cape")) then
		e.self.Say("For the cape you must bring me a moon jewel, a mark of the panther, an iridescent crystal, and an embedded bronze figurine.");
	end
	if(e.message:findi("claw")) then
		e.self.Say("For the claws you must bring me a meteor jewel, a mark of the bestial, an embedded adamantium figurine, and a roaring idol.");
	end
	if(e.message:findi("glove")) then
		e.self.Say("For the gloves you must bring me a star jewel, a mark of the alligator, and embedded electrum figurine.");
	end
	if(e.message:findi("talisman")) then
		e.self.Say("For the talisman you must bring me a cloud jewel, a mark of the shark, and an embedded silver figurine. ");
	end
	if(e.message:findi("veil")) then
		e.self.Say("For the veil you must bring me a sun jewel, a mark of the tiger, and an embedded wooden figurine.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5949, item3 = 5948, item4 = 5950})) then
		e.other:SummonItem(3996);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5941, item3 = 5942, item4 = 5943})) then
		e.other:SummonItem(3993);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5951, item3 = 5952, item4 = 5953})) then
		e.other:SummonItem(3997);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5944, item3 = 5945})) then
		e.other:SummonItem(3994);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5946, item3 = 5947})) then
		e.other:SummonItem(3995);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5939, item3 = 5940})) then
		e.other:SummonItem(3992);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
