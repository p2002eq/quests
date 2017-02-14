function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hi there " .. e.other:GetName() .. ". If you could please try to keep away from Eslof. He is going through a very tough time now as his brother was part of the mining contingent that was working on this here entrance to the Paludal caverns when it caved in sealing up the entrance. We have troops working on the other side around the clock to clear up the rocks. Sorry for any trouble.");
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
