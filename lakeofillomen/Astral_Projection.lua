function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1687})) and (e.other:GetLevel() > 45) and (" .. e.other:Class() .. "=="Monk")) then
		-- Monk Epic 1.0
		eq.depop();
		-- Spawn: Vorash
		eq.spawn2(85211,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
		-- Spawn: Deep
		eq.spawn2(85223,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
