function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. ". I am Ferin Lightfoot. resident of New Tanaan and scholar in my prime. Now. in my retirement from the excitement of my former life as an adventurer. I am here to offer what knowledge I can in order to help those akin to my former life. In addition to basic supplies which you may need on your adventures I also carry some books which may help liven up any dull. boring spells during your travels.");
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
