function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("looks up and smiles.  'Hiya. I just love fishing don't you?'");
	end
	if(e.message:findi("What armor")) then
		e.self:Say("Oh! Tolli sent you over here didn't he. If you're a rogue and want some armor just let me know.");
	end
	if(e.message:findi("I am a rogue")) then
		e.self:Say("This stuff isn't free no sir! I have a mask. cloak. gauntlets. gorget. waistband. and a dirk.  Just ask and I'll tell ya what ya have to do to get it.");
	end
	if(e.message:findi("What mask")) then
		e.self:Say("For the mask of concealment you're going to have to go get me an astral jewel, a mark of deceit, and an engraved fire opal statuette.");
	end
	if(e.message:findi("What cloak")) then
		e.self:Say("For the cloak of concealment you're going to have to go get me a sun jewel, a mark of secrecy, an engraved ivory statuette, and a polished gemstone.");
	end
	if(e.message:findi("What gauntlets")) then
		e.self:Say("For the gauntlets of concealment you're going to have to go get me a moon jewel, a mark of deception, and an engraved gold statuette.");
	end
	if(e.message:findi("What gorget")) then
		e.self:Say("For the gorget of concealment you're going to have to go get me a star jewel, a mark of trickery, and an engraved wooden statuette.");
	end
	if(e.message:findi("What waistband")) then
		e.self:Say("For the waistband of concealment you're going to have to go get me a cloud jewel, a mark of silence, an engraved platinum statuette, and a true silver needle.");
	end
	if(e.message:findi("What dirk")) then
		e.self:Say("For the dirk of concealment you're going to have to go get me a sky jewel, a mark of greed, an engraved mithril statuette, and a dread hilt.");
	end
end
function event_trade(e)
local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5287, item3 = 5288})) then
		e.other:SummonItem(3795);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5289, item3 = 5290, item4 = 5291})) then
		e.other:SummonItem(3796);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5292, item3 = 5293})) then
		e.other:SummonItem(3797);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5294, item3 = 5295})) then
		e.other:SummonItem(3798);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5285, item3 = 5297, item4 = 5298})) then
		e.other:SummonItem(3799);
	end
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5299, item3 = 5326, item4 = 5327})) then
		e.other:SummonItem(3800);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
