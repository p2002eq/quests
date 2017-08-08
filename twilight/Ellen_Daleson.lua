-- Twilight Armor - Ranger
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Oh hello there, I'm in charge of the docks here and wife to Alton.");
	elseif(e.message:findi("ranger")) then
		e.self:Say("Very well. If you want the Woodsman's [" .. eq.say_link("Mantle") .. "], Woodsman's [" .. eq.say_link("Mask") .. "], Woodsman's [" .. eq.say_link("Cape") .. "], Woodsman's [" .. eq.say_link("Gauntlets") .. "], Woodsman's [" .. eq.say_link("Choker") .. "], or Woodsman's [" .. eq.say_link("Belt") .. "] I have some errands that need to be done.");
	elseif(e.message:findi("armor")) then
		e.self:Say("Oh you wish to get the armor that Alton's great granddaddy used to wear. If you are a ranger just let me know.");
	elseif(e.message:findi("belt")) then
		e.self:Say("If you want the Woodsman's Belt bring me a moon jewel, a mark of the environment, a gold pointer, and a broken ancient blade.");
	elseif(e.message:findi("cape")) then
		e.self:Say("If you want the Woodsman's Cape bring me a sky jewel, a mark of creatures, a wondrous stone, and a marble statuette.");
	elseif(e.message:findi("choker")) then
		e.self:Say("If you want the Woodsman's Choker bring me an astral jewel, a mark of ambidexterity, and a small ancient sculpture.");
	elseif(e.message:findi("gauntlets")) then
		e.self:Say("If you want the Woodsman's Guantlets bring me a meteor jewel, a mark of animals, and a tattered old card.");
	elseif(e.message:findi("mantle")) then
		e.self:Say("If you want the Woodsman's Mantle bring me a sun jewel, a mark of rivers, and a temporal sack.");
	elseif(e.message:findi("mask")) then
		e.self:Say("If you want the Woodsman's Mask bring me a cloud jewel, a mark of stone, and a platinum chain.");
	end
end

function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5850, item2 = 5849, item3 = 5848, item4 = 4489})) then -- Broken Ancient Blade, Gold Pointer, Mark of the Environment & Moon Jewel
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3957,25000); -- Woodsmans Girdle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5844, item2 = 5698, item3 = 4492, item4 = 5699})) then -- Marble Statuette, Mark of Creatures, Sky Jewel & Wondrous Stone
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3954,25000); -- Woodsmans Cape
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5981, item3 = 5847})) then -- Astral Jewel, Mark of Ambidexterity & Small Ancient Sculpture
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3956,25000); -- Woodsmans Gorget
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5845, item2 = 4493, item3 = 5846})) then -- Mark of Animals, Meteor Jewel & Tattered Old Card
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3955,25000); -- Woodsmans Gauntlets
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5690, item2 = 4488, item3 = 5691})) then -- Mark of Rivers, Sun Jewel & Temporal Sack
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3950,25000); -- Woodsmans Mantle
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5696, item3 = 5697})) then -- Cloud Jewel, Mark of Stone & Platinum Chain
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3953,25000); -- Woodsmans Mask
	end
	item_lib.return_items(e.self, e.other, e.trade)
end