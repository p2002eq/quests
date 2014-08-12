function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Desist in your prattle.  If you want idle chitchat. talk to someone else.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18017})) then -- Fell Blade Guild Note
		e.self:Say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth.");
		e.other:SummonItem(13573); -- Blood Splattered Tunic
		e.other:Ding();
		e.other:Faction(143,100); -- Heretics
		e.other:Faction(79,-100); -- Deepwater Knights
		e.other:Faction(112,-100); -- Gate Callers
		e.other:Faction(56,-100); -- Craftkeepers
		e.other:Faction(60,-100); -- Crimson Hands
		e.other:AddEXP(100);
	end
	--do all other handins first with plugin, then let it do disciplines
	
	item_lib.return_items(e.self, e.other, e.trade)
end

--END of FILE Zone:paineel  ID:75111 -- Mandaril_Dark_Knife

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
