--Changes by Kagehi
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ". sorry but I have no time to chitchat. I'm looking for the help of a citizen.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2877})) then
		e.self:Say("Some of my wares are spoiling and I must place them in a container to preserve them. I cannot afford to take the loss that would result if they were to rot. Please " .. e.other:GetName() .. ". take this bowl and combine two lumps of gray mud with a flask of water and xakra bile. Take the resulting clay and this sketch with another water flask to fashion an unfired gray jar. Fire it in a kiln with a firing sheet and return to me with the product as soon as you can.");
		e.other:SummonItem(2877);
		e.other:SummonItem(3497); --Reusable Jar Sketch
		e.other:QuestReward(e.self,0,0,0,0,17233); --Ayyad's Clay Bowl.
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 3498})) then
		e.self:Say("Excellent! Please accept this knapsack as payment for your trouble. Here is my seal as well. I can always use more jars and if you give me four of my seals I will share with you a family secret.");
		e.other:SummonItem(17234); --Ayyad's Knapsack.
		e.other:QuestReward(e.self,0,0,0,0,3499); --Ayyad's Seal.
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
