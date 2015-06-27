function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Come to serve the garrison? Good. I aim to offer a reward for the return of four froglok tad tongues. Best if we handle the pesky critters before they grow too big and too numerous.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: 4x Froglok Tad Tongues (12439)
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 12439, item2 = 12439, item3 = 12439, item4 = 12439})) then
		e.self:Say("Well done. It is good to serve the Warlord. Here is a small reward befitting such a small task.");
		e.other:Faction(193,3); -- +Legion of Cabilis
		e.other:Faction(30,1); -- +Cabilis Residents
		e.other:Faction(282,1); -- +Scaled Mystics
		e.other:Faction(62,1); -- +Crusaders of Greenmist
		e.other:Faction(317,1); -- +Swifttails
		e.other:QuestReward(e.self,math.random(10),0,0,0,12616,100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
