--Advanced Magic Manual
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("How do you do, " .. e.other:GetName() .. "? So you think you're skilled in the art of magic, do you? Pay close attention for this course I have for you will test your magical prowess like none before. In order to continue my work I will need for you to bring back a few things for me. When you can locate a Tornado Gem, a Battle Worn Trinket, and a Blue Diamond, return and hand them to me along with your Intermediate Magic Manual. If you can do this, then perhaps maybe there is a shred of hope left for you after all! Be off now and good luck!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 22503, item2 = 26710, item3 = 9424, item4 = 28796})) then--Blue Diamond, Battle Worn Trinket, Tornado Gem, Intermediate Magic Manual
		e.self:Say("I must say, this is a surprise. I was beginning to wonder if you would ever return with these. I'm glad you see you have though. Take this new book and use it well in your future journeys. You may also be interested to know that Tenada Jeried also has a few lesson plans for very advanced students. If you should see him, be sure to tell him you are interested in learning from him. Good luck to you, " .. e.other:GetName() .. "!");--Stole Text from Advanced Combat Manual quest, I have no other reference
		e.other:QuestReward(e.self,0,0,0,0,28797); --Advanced Magic Manual
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
