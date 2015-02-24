function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Well hello there. I am new to the bank. I am helping the Fargins out since it is so busy lately. Mr. Fargin doesn't even have time for his [hobby] these days.");
	elseif(e.message:findi("hobby")) then
		e.self:Say("'Mr. Fargin used to collect rare coins and gems. He came to Firiona Vie to do just that, but now he never has the time to [collect rare coins] since he is always working here. That is why I came to help him out.");
	elseif(e.message:findi("collect rare coins")) then
		e.self:Say("If you want to help, you can begin by replacing Mr. Fargin's prized Star of Odus which was taken from his vault when he stepped out to dine one night. Do so, and I may trust you to collect coins. I will also reward you with an item a composer left here. With Mr. Fargin's approval of course.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	-- You can purchase a Star of Odus for about 115pp in the jewel shop under the Erudin palace.
	-- Giving it to Buford results in a "Tin Box" with 6 slots.
	if(item_lib.check_turn_in(e.trade, {item1 = 10059})) then
		e.self:Say("Thank you!! I never could have gone to Odus to replace this. Perhaps now you can collect some rare coins.");
		e.other:QuestReward(e.self,0,0,0,0,17045);
	end
	-- put the 6 coins into the tin box, combine, and return it to Bufford, get Nostrolo Tambourine
	if(item_lib.check_turn_in(e.trade, {item1 = 12829})) then
		e.other:QuestReward(e.self,0,0,0,0,12940);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
