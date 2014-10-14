function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome friend. May I help you?");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Is the energy related to the Spirits, sire?");
	end
	if(e.signal == 2) then
		e.self:Say("... but, what sort of energy is it sire? Can you understand its nature?");
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
