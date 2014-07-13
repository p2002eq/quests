--Bertoxxulous Initiate quest npc

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10262})) then
		e.self:Emote("ingests the virulent substance and becomes ill.");
		e.other:SummonItem(10263); --Empty infectious vial
		e.other:AddEXP(100);
		-- local x = e.self:GetX();
		-- local y = e.self:GetY();
		-- local z = e.self:GetZ();
		-- local h = e.self:GetHeading();
		eq.spawn2(56003,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
