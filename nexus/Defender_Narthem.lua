function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. ". behind me lies the doomed passageway to the Paludal Caverns. It's a very sore subject that we really don't like to talk about...  Some of our own were lost in the accident.");
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
