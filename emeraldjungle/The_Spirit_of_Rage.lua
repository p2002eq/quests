function event_death_complete(e)
	e.self:Say("Omakin the Stalker looks at you with a kind expression. The large creature smiles at you and motions for you to move away. Perhaps it senses that you have more adventure ahead of you. Its form begins to loosen, as if it were a mirage produced by the jungle heat.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
