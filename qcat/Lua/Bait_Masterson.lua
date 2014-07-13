--------------------------------------------------------------------------
--Quests: Convert Fishermen
--NPC: Marlin Bizmite
--Zone: Qeynos
--Author: RealityIncarnate
--------------------------------------------------------------------------

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You know.. I took up fishing because it was a nice, quiet activity. Most of all, I took it up to avoid conversing with strangers. Get the picture?!!");
	end
	if(e.message:findi("blessing of prexus")) then
		e.self:Say("Prexus!!? Aye!! I once followed the ways of the Ocean Lord. I remember those days. So clear and peaceful were they. I shall make a deal with you, my friend. I shall give up fishing if you give me your guild tunic. With such a tunic I shall once again be compelled to follow the peaceful ways of the Ocean Lord.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13544})) then
		e.self:Say("Nice material!! I feel the ways of Prexus enlightening my soul. Unngh!! Enough of this fishing. Here take my broken fishing pole and toss it to the sea. All hail Prexus!!");
		e.other:SummonItem(13922);
		e.other:Faction(79, 5);
		e.other:Faction(145, 5);
		e.other:Faction(143, -5);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
--END of FILE Zone:qcat  ID:10139 -- Bait_Masterson

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
