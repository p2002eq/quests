-- Razortooth

function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Rarr.  Me is Feren.  Me is fisher.  That means Feren catches [fish].");
	elseif(e.message:findi("what fish")) then
		e.self:Say("All kinds of fish.  Tasty fish.  All day Feren catches the fishes so all Kerran can eat.  I do for good of all Kerran.  Rrrrr.  One thing bother Feren always though.  Is bad fish.  [Razortooth].");
	elseif(e.message:findi("what razortooth")) then
		e.self:Say("Rrrrrr!  Razortooth mean fish.  Razortooth eat fish off Feren's line.  Razortooth gnaw Feren's boat.  Razortooth smart and dangerous.  Feren never able to catch Razortooth.  This haunt Feren for months.  If you was able to catch Razortooth. Feren be forever grateful. Maybe even give you possessions.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 6348})) then --Razor Tooth
		e.self:Say("Rarr, Feren not haunted by Razortooth no more. Feren grateful and give you this possession.");
		e.other:Faction(175,10); -- Kerra Isle
		e.other:QuestReward(e.self,0,0,0,2,1062,500); --Kerran Fishingpole
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end

--END of FILE Zone:kerraridge  ID:74088 -- Feren
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------