-- on live it is a fire based aoe on death reported to be around 552 pts damage
-- exact spell is not specified. using Firebomb, fire based aoe - max damage 499
function event_death_complete(e)
	eq.SelfCast(6043);
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
