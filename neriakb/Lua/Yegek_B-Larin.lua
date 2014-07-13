function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. A brother of the Indigo you must be. Why else would one dare to roam the corridors of the Cauldron of Hate? You were most likely sent to speak with Yegek. If so. speak up and tell Yegek who [sent] you."); end
	end
end

function event_trade(e)
	local item_lib = require("items");
	--do all other handins first with plugin, then let it do disciplines
	
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:neriakb  ID:41031 -- Yegek_B`Larin

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
