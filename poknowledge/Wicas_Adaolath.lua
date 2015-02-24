--The Magic Pool
function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Nothing at all. Do you think that he led us astray?");
	end
	if(e.signal == 2) then
		e.self:Say("I think we should just do what [Tarerd] wants us to do.");
	end
end

function event_say(e)
	if(e.message:findi("tarerd")) then
		e.self:Say("Tarerd is the one who told us about these pools. He wanted us to kill some sort of lizards for him, but we have neither the time nor energy for such adventures. Perhaps you can get some information about the pools from him.");
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
