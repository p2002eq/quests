function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome to the Furrier Royale. Here you will find the finest skins from a variety of Norraths lesser creatures."); end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 16170, item2 = 16170})) then
		e.self:Emote("Medron Y`Lask stretches and fastened the basilisk skins across the shield frame and attaches a leather strap and grip to the back of the shield. Here is your new shield young Shadowknight. I have been paid in advance by the Lodge of the Dead for the shields assembly. May Innoruuk strengthen you in your service to Her Majesty Queen Cristanos.");
		e.other:SummonItem(19610);
		e.other:AddEXP(1000);
		e.other:Faction(69,10);
		e.other:Faction(87,10);
		e.other:Faction(88,10);
	end
end
--END of FILE Zone:neriakc  ID:42060 -- Medron_Y`Lask


-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
