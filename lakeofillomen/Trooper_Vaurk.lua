function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Have you been sent by the War Baron to [assist]? The explorers from Firiona Vie draw closer.");
	elseif(e.message:findi("assist")) then
		e.self:Say("That is good, I will stay here to halt any advances. Head out near the lake and destroy the trespassers on our land! Bring me four of their knives that they carry for survival. Prove your allegiance to the Legion of Cabilis.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	--Handin: 4x Explorer Survival Knife (8004)
	if(item_lib.check_turn_in(e.trade, {item1 = 8004, item2 = 8004, item3 = 8004, item4 = 8004})) then
		e.self:Say("Great work, the Legion of Cabilis will not soon forget your dedication. The trespassers shall all be dealt with.");
		e.other:Faction(193,10); -- +Legion of Cabilis
		e.other:Faction(30,10); -- +Cabilis Residents
		e.other:Faction(282,10); -- +Scaled Mystics
		e.other:Faction(62,10); -- +Crusaders of Greenmist
		e.other:Faction(317,10); -- +Swifttails
		e.other:QuestReward(e.self,0,0,0,0,0,25);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
