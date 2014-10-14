function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 30961})) then
		e.self:Say("Oh " .. e.other:GetName() .. "! This is a whisperling. and she is beautiful! You must find a way to free her of this anchor. Take her to Ragnar. he may know what to do. Let me put her in this bag to keep her safe for now.");
		e.other:Faction(132,1); --Guardian of Shar Vahl
		e.other:QuestReward(e.self,0,0,0,0,30962);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
