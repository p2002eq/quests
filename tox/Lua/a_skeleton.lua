function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13894})) then
		e.self:Say("Aye.. You cut out the middleman..  I shall reward you.. hmm..  I have not found anything. how about..  <CRACK!! SNAP!! RIPP!!>  How about something off meself?");
		e.other:SummonItem(eq.ChooseRandom(9304,12195,13073,13074));
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:tox  ID:78028 -- a_skeleton


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
