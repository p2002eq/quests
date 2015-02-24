function event_spawn(e)
	eq.set_timer("1",120000);
end

function event_timer(e)
	if(e.timer == "1") then
		local rand = math.random(4);
		if(rand == 1) then
			e.self:Say("All that Bustle! Come relax and have yourself a meal.");
		end
		if(rand == 2) then
			e.self:Say("I have plenty of food and drink. You must be hungry with all that running about.");
		end
		if(rand == 3) then
			e.self:Say("Over there! Come come, Try one of my many great dishes!");
		end
		if(rand == 4) then
			e.self:Say("Treat yourself to a hot freshly baked moor fish pie! They're fresh!");
		end
	end
end

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings friend. Have a look at all this delicious food. If you have any questions about them just ask! That's what I'm here for.");
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
