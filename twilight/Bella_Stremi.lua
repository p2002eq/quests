---- Twilight Armor - Necromancer
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah hello and welcome ".. e.other:GetName() .. ". tis a pleasure to see some new faces.  I have the finest wares to be found. be sure to check them out. Are ya by chance a [necromancer]");
	elseif(e.message:findi("necromancer")) then
		e.self:Say("I have a [cap], [robes], [sleeves], [pants], [shawl], [bracer], and [sandals] for a necromancer. Frantip has the rest just ask him about armor and I'm sure he'll help you. Which are you interested in?");
	elseif(e.message:findi("cap")) then
		e.self:Say("For the cap of pestilence you'll have to bring me a sky jewel, an aged gold coin, a dark gem, and a priceless book.");
	elseif(e.message:findi("robe")) then
		e.self:Say("For the robe of pestilence you'll have to bring me a meteor jewel, a miniature armband, a mark of fortune, and a sun wraith eye.");
	elseif(e.message:findi("sleeves")) then
		e.self:Say("For the sleeves of pestilence you'll have to bring me an astral jewel, a petrified totem, a frozen hailstone, and a glowing crystal.");
	elseif(e.message:findi("pants")) then
		e.self:Say("For the pants of pestilence you'll have to bring me a sun jewel, a divining rod, an aged platinum symbol, and a silver sign.");
	elseif(e.message:findi("shawl")) then
		e.self:Say("For the shawl of pestilence you'll have to bring me a moon jewel an ancient fossil, and some wrought iron shavings.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer of pestilence you'll have to bring me a star jewel, a granite idol, and an ancient silver coin.");
	elseif(e.message:findi("sandals")) then
		e.self:Say("For the sandals of pestilence you'll have to bring me a cloud jewel, a blackened ornament, and a snake scale sceptre.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 4492, item2 = 4741, item3 = 4742, item4 = 4743})) then -- Sky Jewel, Aged Gold Coin, Dark Gem & Priceless Book
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3723,10000); -- Cap of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4493, item2 = 4744, item3 = 4745, item4 = 4746})) then -- Meteor Jewel, Miniature Armband, Mark of Fortune & Sun Wraith Eye
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3724,10000); -- Robe of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 4748, item3 = 4749, item4 = 4750})) then -- Astral Jewel, Petrified Totem, Frozen Hailstone & Glowing Crystal
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3725,10000); -- Sleeves of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4488, item2 = 4751, item3 = 4752, item4 = 4753})) then -- Sun Jewel, Divining Rod, Aged Platinum Symbol & Silver Sign
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3726,10000); -- Pants of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4489, item2 = 4771, item3 = 4772})) then -- Moon Jewel, Ancient Fossil & Wrought Iron Shavings
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3727,10000); -- Shawl of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4490, item2 = 4773, item3 = 4774})) then -- Star Jewel, Granite Idol & Ancient Silver Coin
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3728,10000); -- Bracer of Pestilence
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4491, item2 = 4775, item3 = 4776})) then -- Cloud Jewel, Blackened Ornament & Snake Scale Sceptre
		e.self:Emote("smiles.");
		e.self:Say("Here is what I promised, ".. e.other:GetName() .. ".");
		e.other:QuestReward(e.self,0,0,0,0,3729,10000); -- Sandals of Pestilence
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
