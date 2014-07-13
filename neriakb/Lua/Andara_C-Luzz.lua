function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 19582, item2 = 19583, item3 = 16166})) then
		e.other:SummonItem(19611);
		e.self:Say("Well done " .. e.other:GetName() .. "!  Use this with pride.");
		e.other:AddEXP(1000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
