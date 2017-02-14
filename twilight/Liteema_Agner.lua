---- Twilight Armor - Rogue
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("looks up and smiles.  'Hiya. I just love fishing don't you?'");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh! Tolli sent you over here didn't he. If you're a [rogue] and want some armor just let me know.");
	elseif(e.message:findi("rogue")) then
		e.self:Say("This stuff isn't free no sir! I have a mask. [cloak], [gauntlets], [gorget], [waistband] and a [dirk]. Just ask and I'll tell ya what ya have to do to get it.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask of concealment you're going to have to go get me an astral jewel, a mark of deceit, and an engraved fire opal statuette.");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak of concealment you're going to have to go get me a sun jewel, a mark of secrecy, an engraved ivory statuette, and a polished gemstone.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("For the gauntlets of concealment you're going to have to go get me a moon jewel, a mark of deception, and an engraved gold statuette.");
	elseif(e.message:findi("gorget")) then
		e.self:Say("For the gorget of concealment you're going to have to go get me a star jewel, a mark of trickery, and an engraved wooden statuette.");
	elseif(e.message:findi("waistband")) then
		e.self:Say("For the waistband of concealment you're going to have to go get me a cloud jewel, a mark of silence, an engraved platinum statuette, and a true silver needle.");
	elseif(e.message:findi("dirk")) then
		e.self:Say("For the dirk of concealment you're going to have to go get me a sky jewel, a mark of greed, an engraved mithril statuette, and a dread hilt.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5287, item3 = 5288})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3795,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5289, item3 = 5290, item4 = 5291})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3796,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5292, item3 = 5293})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3797,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5294, item3 = 5295})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3798,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5285, item3 = 5297, item4 = 5298})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3799,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5299, item3 = 5326, item4 = 5327})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3800,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
