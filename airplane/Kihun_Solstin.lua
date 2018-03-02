function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So, you have made it this far. I am Kihun Solstin, the Master of Wind. I control the unfettered Element like none other. As you should have learned, Air is the most potent of Elements. It fuels Fire, Water is comprised of it, and Earth cannot restrain it. Knowing this, do you seek the Element of Wind?");
	elseif(e.message:findi("element of wind")) then
		e.self:Say("I will test you then. In this wondrous plane of Sky, find the Crown of Elemental Mastery. Then, search the world below for an Elemental Binder and a cloak fashioned from the feathers of a Pegusus. Return them to me and I shall give you the Element of Wind.");
	elseif(e.message:findi("see the master")) then
		eq.unique_spawn(710.040,0,0,604.5,1346.3,-766,0); 	--spawn the master of elements
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20764, item2 = 28043, item3 = 2463})) then
		e.self:Say("If you have obtained the other, lesser Elements, go speak with The Master of Elements, who will be waiting for you. I wish you luck. If you have not completed all the tasks set for you, let me know, and just ask to see the Master when you are ready.");
		e.other:QuestReward(e.self,0,0,0,0,28033,5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
