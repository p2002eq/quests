function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Why is it that you have come to this place? If you are coming here to search for [magical scrolls], just get back on that so-called ship you came here on and forget everything you thought you heard.");
	elseif(e.message:findi("magical scrolls")) then
		e.self:Say("Is your hearing failing you!? Unless you [have something I need]. be gone!");
	elseif(e.message:findi("i have something you need")) then
		e.self:Say("I must have the scrolls of Gift of Xev. Bristlebane's Bundle. Quiver of Marr. and the Scars of Sigil. If you don't have one of these. leave my sight!  If you do. I think we can work up a fair trade.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 19351}) or item_lib.check_turn_in(e.trade, {item1 = 19347}) or item_lib.check_turn_in(e.trade, {item1 = 19354}) or item_lib.check_turn_in(e.trade, {item1 = 19358})) then
		e.self:Say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
		e.other:QuestReward(e.self,0,0,0,0,eq.ChooseRandom(19368,19346,19355,19357),1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
