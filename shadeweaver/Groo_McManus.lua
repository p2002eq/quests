function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings adventure seeker. I have come from afar to study this strange thicket. The spirits are strong within this region, but they are secretive as well.  I am willing to impart my wisdom to those who will aid me in my exploration. Are you [interested?]");
	elseif(e.message:findi("I am interested")) then
		e.self:Say("Very well then! Let us begin.  First you must attune yourself with the nature of spirits. For this you must learn to find a spiritual anchor. Find such a thing within the crater that surrounds Shar Vahl and return it to me.  Then we may continue. I cannot tell you more, but there is a Vah Shir who has the knowledge that you seek. Seek him out in this thicket to learn what you can.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 30601})) then
		e.self:Say("Excellent! You have done well.  I can sense that you are in tune with the spirits around you. Take this, for you will need it in your next task. When you are [ready] for your next lesson let me know.");
		e.other:QuestReward(e.self,0,0,0,0,15093);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
