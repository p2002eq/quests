function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 == 18905})) then
		e.self:Say("Eh, strapling? Ye got this from me ol' partner? Huh. Aye, I know what it means but ye're not hearin'. Here, take this. It was his but he's not needin' it now.");
		e.other:AddEXP(30000);
		e.other:Ding();
		e.other:SummonItem(eq.ChooseRandom(5037,5029,13313));
	end
end

--by Angelox
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
