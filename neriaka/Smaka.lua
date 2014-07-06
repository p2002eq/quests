-- Part of SK Epic 1.0

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You want stuff? Or mebby you looks for a cure?");
	elseif(e.message:findi("cough elixir")) then
		e.self:Say("Ahh, you want me cure?! It cost lots of money, big big secret it is. Only us ogres know how to make. You wants? Only 1000 platinum! Make you feels bedder in no times!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {platinum = 1000})) then
		e.self:Say("Okay, enjoy me drink!");
		e.other:Faction(69,5); --Dark Bargainers
		e.other:Faction(88,5); --Dreadguard Outer
		e.other:Faction(87,5); --Dreadguard Inner
		e.other:SummonItem(14365); --Cough Elixir
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
