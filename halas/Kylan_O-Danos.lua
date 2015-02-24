function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18760})) then
		e.self:Say("Greetin's! We are the mighty Wolves o' the North, protectors o' Halas, and we must work hard t' keep it safe fer our citizens. Here is our tunic, it identifies ye as a proud warrior o' this great city. Let's get started with yer training, then, shall we?");
		e.other:Ding();
		e.other:SummonItem(13511);
		e.other:Faction(361,100);	-- Wolves of the North
		e.other:Faction(294,20); 	-- Shamen of Justice
		e.other:Faction(213,25);	-- Merchants of Halas
		e.other:Faction(311,5); 	-- Steel Warriors
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
