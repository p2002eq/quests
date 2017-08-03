---- Twilight Armor - Beastlord
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there. please leave me alone I would like some peace and quiet.'");
	elseif(e.message:findi("armor")) then
		e.self:Say("amben must have told you about the old beastlord we came upon. So tell me are you a worthy [" .. eq.say_link("beastlord") .. "]?");
	elseif(e.message:findi("beastlord")) then
		e.self:Say("Then you must want the armor I have. I have the [" .. eq.say_link("veil") .. "], [" .. eq.say_link("cape") .. "], [" .. eq.say_link("gloves") .. "], [" .. eq.say_link("talisman") .. "], [" .. eq.say_link("belt") .. "], and [" .. eq.say_link("claws") .. "].");
	elseif(e.message:findi("belt")) then
		e.self:Say("For the belt you must bring me a sky jewel, a mark of the wolf, an embedded steel figurine, and ancient wrappings.");
	elseif(e.message:findi("cape")) then
		e.self:Say("For the cape you must bring me a moon jewel, a mark of the panther, an iridescent crystal, and an embedded bronze figurine.");
	elseif(e.message:findi("claws")) then
		e.self:Say("For the claws you must bring me a meteor jewel, a mark of the bestial, an embedded adamantium figurine, and a roaring idol.");
	elseif(e.message:findi("glove")) then
		e.self:Say("For the gloves you must bring me a star jewel, a mark of the alligator, and embedded electrum figurine.");
	elseif(e.message:findi("talisman")) then
		e.self:Say("For the talisman you must bring me a cloud jewel, a mark of the shark, and an embedded silver figurine.");
	elseif(e.message:findi("veil")) then
		e.self:Say("For the veil you must bring me a sun jewel, a mark of the tiger, and an embedded wooden figurine.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 5949, item3 = 5948, item4 = 5950})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3996,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 5941, item3 = 5942, item4 = 5943})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3993,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 5951, item3 = 5952, item4 = 5953})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3997,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 5944, item3 = 5945})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3994,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 5946, item3 = 5947})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3995,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 5939, item3 = 5940})) then
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3992,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end