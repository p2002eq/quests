function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up from her teary handkerchief, the deepest sadness visible in her eyes");
		e.self:Say("I am very sorry, but I am not very good company at the moment. I fear my love will never return.");
	end
	if(e.message:findi("what love")) then
		--not live text
		e.self:Say("Oh my love is gone away.  Our story is so difficult to tell.");
	end
	if(e.message:findi("what story")) then
		--not live text
		e.self:Say("Here.  Take this and read it, I can't bear to relate it again");
		e.other:SummonItem(18324);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
