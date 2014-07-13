-- Ilanic's Scroll

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("My scroll must find my [scroll] so I may finish my research.");
	end
	if(e.message:findi("scroll")) then
		e.self:Say("Kobold! Kobold!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:erudnint  ID:38150 --  Ilanics_skeleton

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
