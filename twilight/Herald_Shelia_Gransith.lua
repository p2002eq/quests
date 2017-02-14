---- Twilight Armor - Bard
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Twilight Sea!  This is the docking entrance to Katta Castellum. ".. e.other:GetName() .. ", Tell me do you know any [songs]?");
	elseif(e.message:findi("songs")) then
		e.self:Say("Ah you do. You don't happen to be a [bard] do you?");
	elseif(e.message:findi("bard")) then
		e.self:Say("Great. I have just what you need. Would you like to earn some [armor]?");
	elseif(e.message:findi("armor")) then
		e.self:Say("I thought so I have a [helm], [breastplate], [vambraces], [greaves], [pauldrons], [bracer], and [boots]. For the rest speak to Brolan over there about armor.");
	elseif(e.message:findi("breastplate")) then
		e.self:Say("For the breastplate you must bring me an astral jewel, a mark of music, a diamond studded medal, and a glorious flower.");
	elseif(e.message:findi("vambraces")) then
		e.self:Say("For the vambraces you must bring me a sun jewel, a mark of entertainment, a sapphire studded medal, and velvet sleeves.");
	elseif(e.message:findi("greaves")) then
		e.self:Say("For the greaves you must bring me a moon jewel, a mark of the drum, an emerald studded medal, and memory crystal.");
	elseif(e.message:findi("pauldrons")) then
		e.self:Say("For the pauldrons you must bring me a star jewel, a mark of the mandolin, and an opal studded medal.");
	elseif(e.message:findi("bracer")) then
		e.self:Say("For the bracer you must bring me a cloud jewel, a mark of song, and a pearl studded medal.");
	elseif(e.message:findi("boots")) then
		e.self:Say("For the boots you must bring me a sky jewel, a mark of poetry, and a star ruby studded medal.");
	elseif(e.message:findi("helm")) then
		e.self:Say("For the helm you must bring me a meteor jewel, a mark of rhythm, a ruby studded medal, and a fancy necklace.");
	end
end
function event_trade(e)
	local item_lib = require('items');
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 5347, item2 = 4492, item3 = 5348})) then
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:QuestReward(e.self,0,0,0,0,3909,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5346, item2 = 5345, item3 = 4491})) then
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:QuestReward(e.self,0,0,0,0,3908,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 4494, item2 = 5335, item3 = 5336, item4 = 5334})) then
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:QuestReward(e.self,0,0,0,0,3898,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5341, item2 = 5340, item3 = 5342, item4 = 4489})) then
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:QuestReward(e.self,0,0,0,0,3900,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5343, item2 = 5344, item3 = 4490})) then
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:QuestReward(e.self,0,0,0,0,3907,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5337, item2 = 5338, item3 = 4488, item4 = 5339})) then
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:QuestReward(e.self,0,0,0,0,3899,10000); --
	elseif(item_lib.check_turn_in(e.self, e.trade, {item1 = 5330, item2 = 5328, item3 = 4493, item4 = 5329})) then
		e.self:Emote("sings loudly as she hands you your reward");
		e.self:Say("Thank you. May your voice be ever true.");
		e.other:QuestReward(e.self,0,0,0,0,3897,10000); --
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
