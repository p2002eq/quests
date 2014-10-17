-- Part of SK Epic 1.0
function event_spawn(e)
	e.self:Say("Young one, you cannot fathom how long it has been since I breathed air and felt flesh on my bones. I told you I would show you a weapon that would make you the most powerful of your kind. I said nothing of giving it to you. Feast your eyes on Innoruuk's Curse, mortal! Thank you for your service.");
end

function event_death_complete(e)
	eq.spawn2(90189,0,0,28.1,1.4,7,192.5); ----Marl Kastane
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
