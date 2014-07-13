--Rysva_To-Biath.pl
--Book of Turmoil

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello.  Let me know if I can get you a drink.");
	end
end
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18200})) then--
		e.self:Say("Take this note and be gone with you.");
		e.other:SummonItem(18201);--a note (book of Turmoil, Text: TomeOfAges2)
		e.other:Faction(87, 10);--Dreadguard Inner
		e.other:Faction(88, 10);--Dreadguard Outer
		e.other:Faction(69, 10);--Dark Bargainers
	
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13846})) then--Dark Elf Decapitated Head
		e.self:Say("Take this book and be gone with you.");
		e.other:SummonItem(18202);--Book of Turmoil
		e.other:Faction(87, 10);--Dreadguard Inner
		e.other:Faction(88, 10);--Dreadguard Outer
		e.other:Faction(69, 10);--Dark Bargainers
		e.other:AddEXP(72900);--10% of level 10 xp
		--The mob you kill for this quest is trivial at even level 10, or should be.  Giving a percentage of level 40
		--xp seems too much.
	
	-- [FLAG: Manual conversion needed: $platinum] elseif(item_lib.check_turn_in(e.trade, {item1 = 19071, item2 = 19070}) && $platinum >= 1000) then {
		e.other:SummonItem(18302);
	end
	item_lib.return_items(e.self, e.other, e.trade)
	end--END of FILE Zone:neriakb  ID:41042 -- Rysva_To`Biath

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
