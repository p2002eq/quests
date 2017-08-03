-- Twilight Armor - Ranger
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to Jern's Rest! I'm the owner and proprietor of this inn, its been in my family for generations. My great grandaddy, Jern, built it back when Katta Castellum was first being built. If ya be wantin' of anything dont hesitate to ask.");
	elseif(e.message:findi("armor")) then
		e.self:Say("His armor has also been in the family for generations, if ye be a [" .. eq.say_link("ranger") .. "] I dont have much use for it running this inn. I'll just need something in return for it.");
	elseif(e.message:findi("ranger")) then
		e.self:Say("Excellent! If you are interested I have the Woodsman's [" .. eq.say_link("Helm") .. "], Woodsman's [" .. eq.say_link("Mail") .. "], Woodsman's [" .. eq.say_link("Vambraces") .. "], Woodsman's [" .. eq.say_link("Greaves") .. "], Woodsman's [" .. eq.say_link("Bracer") .. "], Woodsman's [" .. eq.say_link("Boots") .. "], and the Woodsman's [" .. eq.say_link("Axe") .. "]. If you are interested in the rest of his armor youll have to ask my wife Ellen, shell have some errands you can run for her.");
	elseif(e.message:findi("axe")) then
		e.self:Say("If you want the Woodsman's Axe you will have to acquire these items a sun jewel, a mark of the naturalist, some ancient pottery, and a fossillized skull.");
	elseif(e.message:findi("boots")) then
		e.self:Say("If you want the Woodsman's Boots you will have to acquire these items a star jewel, a mark of timber, and a gilded steel rod.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("If you want the Woodsman's Bracer you will have to acquire these items a moon jewel, a mark of lakes, and some lightning dust.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("If you want the Woodsman's Greaves you will have to acquire these items: An astral jewel, a mark of oceans, a pouch of fire stones, and a cat skin pouch.");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the Woodsman's Helm you will have to acquire these items: A cloud jewel, a mark of leaves, a frost covered leaf, and some sea grass.");
	elseif(e.message:findi("mail")) then
		e.self:Say("To get the Woodsman's Mail you will have to acquire these items a sky jewel, a mark of forests, a frozen vial, and a tro jeg brain.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("If you want the Woodsman's Vambraces you will have to acquire these items a meteor jewel, a mark of mountains, a tro jeg eye, and a solstice rune.");
	end
end

function event_trade(e)
	local item_lib = require('items');
	if (item_lib.check_turn_in(e.self, e.trade, {item1 = 5852, item2 = 5853, item3 = 5851, item4 = 4488})) then -- Ancient Pottery, Fossilized Skull, Mark of the Naturalist & Sun Jewel
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3958,25000); -- Woodsmans Axe
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 5695, item2 = 5694, item3 = 4490})) then -- Gilded Steel Rod, Mark of Timber & Star Jewel
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3952,25000); -- Woodsmans Boots
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 5693, item2 = 5692, item3 = 4489})) then -- Lightning Dust, Mark of Lakes & Moon Jewel
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3951,25000); -- Woodsmans Bracer
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5689, item3 = 5687, item4 = 5688})) then -- Astral Jewel, Cat Skin Pouch, Mark of Oceans & Pouch of Fire Stones
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3949,25000); -- Woodsmans Gauntlets
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5679, item3 = 5678, item4 = 5680})) then -- Cloud Jewel, Frost Covered Leaf, Mark of Leaves & Sea Grass
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3946,25000); -- Woodsmans Coif
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 5682, item2 = 5681, item3 = 4492, item4 = 5683})) then -- Frozen Vial, Mark of Forests, Sky Jewel & Tro Jeg Brain
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3947,25000); -- Woodsmans Mail
	elseif (item_lib.check_turn_in(e.self, e.trade, {item1 = 5684, item2 = 4493, item3 = 5686, item4 = 5685})) then -- Mark of Mountains, Meteor Jewel, Solstice Rune & Tro Jeg Eye
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3948,25000); -- Woodsmans Vambraces
	end
	item_lib.return_items(e.self, e.other, e.trade)
end