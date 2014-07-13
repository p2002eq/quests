function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18757})) then --tattered note
		e.self:Say("Hmmm, I hope you're tougher than you look. Here, put this on. Go find Ulraz, he'll beat you into shape. There's no turning back now, punk. So, you'd better do well, got it?");
		e.other:Ding();
		e.other:SummonItem(13586); --Black Training Tunic
		e.other:Faction(322,100); --The Dead
		e.other:Faction(268,15); --Queen Cristanos Thex
		e.other:Faction(177,-15); --King Naythox Thex
		e.other:Faction(170,-15); --Keeper of the Art
		e.other:Faction(91,-15); --Eldritch Collective
		e.other:Faction(260,-200); --Primodial Malice
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:neriakc  ID:42069 -- Nezzka_Tolax

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
