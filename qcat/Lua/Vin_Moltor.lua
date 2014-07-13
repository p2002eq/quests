function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Heh?? .. BURRP!.. Leave me be will ya.");
	end
	if(e.message:findi("paw of opolla")) then
		e.self:Say("Paw ya say? Yeah.. Yeah .. I got this ratty old thing still. You want it? Its yours for a Bottle of Kalish and hm.. .. How bad you want it?  Hm..  Two..  No no..  Three Gold..  Er..  NO! Wait. Pie..  Yes! Rat Ear Pie is what I want.. Three Bottles of Kalish and a Rat Eat Pie. If you want the Paw that is my price.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13016, item2 = 13016, item3 = 13016, item4 = 13192})) then
		e.self:Say("Ah thanks, here is what I promised you.");
		e.other:SummonItem(17014);
	end
	if(item_lib.check_turn_in(e.trade, {item1 = 13016, item2 = 13016, item3 = 13016, item4 = 18103})) then
		e.self:Say("Ah thanks, here is what I promised you.");
		e.other:SummonItem(17014);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
