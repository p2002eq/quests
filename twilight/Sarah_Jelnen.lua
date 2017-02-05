---- Twilight Armor - Shaman
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("closes her eyes and sighs wistfully as if remembering some long forgotten bittersweet memory. 'Hafron must have told you about our dearly missed friend Hadon. Very well, are you a [shaman]?");
	elseif(e.message:findi("shaman")) then
		e.self:Say("Aye, you have the look of one who communes with spirits. The pieces that I have are the [mask], [cloak], [gauntlets], [talisman], [girdle] and [spear].");
	elseif(e.message:findi("cloak")) then
		e.self:Say("For the cloak you must get me a cloud jewel, mark of auspice, an avatar's tome, and a rockhopper spirit fetish.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("For the gauntlets you must get me a sky jewel, a mark of guidance, and a vitality gem.");
	elseif(e.message:findi("girdle")) then
		e.self:Say("For the girdle you must get me an astral jewel, a mark of augury, an aged runic crutch, and a lined towel.");
	elseif(e.message:findi("mask")) then
		e.self:Say("For the mask you must get me a star jewel, the mark of the oracle, and an aged bone fetish.");
	elseif(e.message:findi("spear")) then
		e.self:Say("For the spear you must get me a sun jewel, a mark of premonition, a darkened shaft, and an oracle orb.");
	elseif(e.message:findi("talisman")) then
		e.self:Say("For the talisman you must get me a meteor jewel, a mark of rage, and a spirit marked ornament.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4940, item3 = 4949, item4 = 4950})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3757,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4951, item3 = 4952})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3758,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4955, item3 = 4956, item4 = 4957})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3760,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4938, item3 = 4939})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3756,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4959, item3 = 4960, item4 = 4958})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3761,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4953, item3 = 4954})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3759,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
