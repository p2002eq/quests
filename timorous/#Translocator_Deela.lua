
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello there. We have most the ships working again. If you need to [travel to Butcherblock] or want to know more about [travel to Overthere],  [travel to Oasis] or [travel to Firiona] I can help you with this.");
	end
	if(e.message:findi("travel to butcherblock")) then
		e.other:MovePC(68,3168.92,851.92,11.66);
	end
	if(e.message:findi("travel to overthere")) then
		e.self:Say("The bloated Belly docks at the ogre camp");
	end
	if(e.message:findi("travel to oasis")) then
		e.self:Say("Take the raft north of the ogre camp");
	end
	if(e.message:findi("travel to firiona")) then
		e.self:Say("Take the shuttle to Firiona Vie");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

--REVISED: Angelox
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
