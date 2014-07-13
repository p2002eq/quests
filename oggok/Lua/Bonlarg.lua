function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Shadowknight master me be!!  " .. e.other:GetName() .. " prove to me that " .. e.other:GetName() .. " be worthy to be one with Greenblood and me give " .. e.other:GetName() .. " black shadow tunic.  You [want black shadow tunic]?");
	end
	if(e.message:findi("i want black shadow tunic")) then
		e.self:Say("Help Greenbloods you will. Give lizard tails to Grevak.  Den maybe we trust.");
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
