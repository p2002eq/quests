function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ".  It is great to see new faces again around the Nexus.  We are lucky to have some of the finest and most powerful magicians working hard to aid our cause.");
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
