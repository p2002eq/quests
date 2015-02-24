function event_combat(e)
	e.self:Say("The time has come for you to taste the might of my magic");
end

function event_death_complete(e)
	e.self:Emote("'s corpse tries to mumble one last spell before falling over dead.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Angelox
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
