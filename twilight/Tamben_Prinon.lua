function event_say(e)
	if(e.message:findi("hail")) then
		e.self.Emote("looks over you examining you from head to toe. 'Ye have the look of an adventurer. I have a tale to tell if you would like to hear it.'");
	end
	if(e.message:findi("tale")) then
		e.self.Say("Years ago I and Jilan were traveling around the far reaches of this land. One day we came upon an old vah shir who was injured in the mountains. He implored us to help him. Do you wish me to continue?");
	end
	if(e.message:findi("continue")) then
		e.self.Say("As I was saying this old vah shir required assistance.  We bound his wounds and he asked us to take his armor and give it to a Beastlord worthy of wearing it.  Are you a worthy beastlord?");
	end
	if(e.message:findi("cap")) then
		e.self.Say("For the cap you must prove your worth. Go gather up a sun jewel, a mark of feral spirits, an embedded copper figurine, and a frosted stone.");
	end
	if(e.message:findi("tunic")) then
		e.self.Say("For the tunic you must prove your worth. Go gather up a moon jewel, a mark of animal spirits, a silver gilded bracelet, and an embedded mithril figurine.");
	end
	if(e.message:findi("sleeves")) then
		e.self.Say("For the sleeves you must prove your worth. Go gather a star jewel, a mark of wild spirits, an embedded clay figurine, and a furrowed carving.");
	end
	if(e.message:findi("leggings")) then
		e.self.Say("For the leggings you must prove your worth. Go gather a cloud jewel, a mark of natural spirits, an embedded stone figurine, and a blue moonstone.");
	end
	if(e.message:findi("mantle")) then
		e.self.Say("For the mantle you must prove your worth. Go gather a sky jewel, a mark of wilderness, and an embedded platinum figurine.");
	end
	if(e.message:findi("bracer")) then
		e.self.Say("For the bracer you must prove your worth. Go gather a meteor jewel, a mark of animal training, and an embedded brass figurine.");
	end
	if(e.message:findi("boots")) then
		e.self.Say("For the boots you must prove your worth. Go gather an astral jewel, a mark of beast mastery, and an embedded gold figurine.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5921, item3 = 5927, item4 = 5928})) then
		e.other:SummonItem(3985);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5929, item3 = 5922, item4 = 5923})) then
		e.other:SummonItem(3986);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5925, item3 = 5924, item4 = 5926})) then
		e.other:SummonItem(3987);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5930, item3 = 5931, 		e.other:SummonItem(3988);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5933, item3 = 5934})) then
		e.other:SummonItem(3989);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5935, item3 = 5936})) then
		e.other:SummonItem(3990);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5937, item3 = 5938})) then
		e.other:SummonItem(3991);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
