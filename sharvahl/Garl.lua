function event_spawn(e)
	eq.set_timer("1",110000);
end

function event_timer(e)
	if(e.timer == "1") then
		local rand = math.random(3);
		if(rand == 1) then
			e.self:Say("Hey! You! Come take a look at these shields. Not only will they prevent disfiguring scars, but they are great protection from the rain as well. I'll cut you a deal, come have a look.");
		end
		if(rand == 2) then
			e.self:Say("Hail traveler! Come take a look at my shields. They can save your life.");
		end
		if(rand == 3) then
			e.self:Say("You there! Dare you venture out unprotected? It won't do you any harm to take one of my shields with you.");
		end
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
