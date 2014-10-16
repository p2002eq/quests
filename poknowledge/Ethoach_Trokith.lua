--Advanced Stealth Manual
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day, " .. e.other:GetName() .. ". It would appear you have learned much about the art of stealth already, and this is good. Are you ready to learn more? If so, listen closely. To graduate to the next level of precision and cunning you need to discover a few items. Bring forth a Blizzard Gem, a Symbol of the Diaku, a Blue Diamond, and your Intermediate Stealth Manual. I feel this will be an adequate test of your skill at this stage in your development. Good luck!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 22503, item2 = 9423, item3 = 26709, item4 = 28793})) then--Blue Diamond, Blizzard Gem, Symbol of the Diaku, Intermediate Stealth Manual
		e.self:Say("I must say, this is a surprise. I was beginning to wonder if you would ever return with these. I'm glad you see you have though. Take this new book and use it well in your future journeys. You may also be interested to know that Tenada Jeried also has a few lesson plans for very advanced students. If you should see him, be sure to tell him you are interested in learning from him. Good luck to you, " .. e.other:GetName() .. "!");--Stole Text from Advanced Combat Manual quest, I have no other reference
		e.other:QuestReward(e.self,0,0,0,0,28794); --Advanced Stealth Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
