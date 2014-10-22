function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Many frogloks in here. Beware! They can be a sneaky bunch. I hear tales of a froglok village nearby.");
	elseif(e.message:findi("sign the restraining order")) then
		e.self:Say("I have been expecting this. Oh, well... Can't argue with the Baron or he will have both our heads. Keeping that in mind, I will make you a deal. I will sign the order if you bring me one of those grand skipping stones these Frogloks are said to have. Bring me the stone and the order and I shall sign.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18243, item2 = 12425})) then --Legion Order (3 signed), Skipping Stone
		e.self:Say("So smooth. I shall be the skipping stone champion! Here. You may have my autograph.");
		e.other:QuestReward(e.self,7,0,0,0,18244,500); --Legion Order (4 signed)
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18243})) then
		e.self:Say("No deal! You bring me the legion order and the froglok skipping stone.");
		e.other:QuestReward(e.self,0,0,0,0,18243);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12425})) then
		e.self:Say("No deal! You bring me the legion order and the froglok skipping stone.");
		e.other:QuestReward(e.self,0,0,0,0,12425);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
