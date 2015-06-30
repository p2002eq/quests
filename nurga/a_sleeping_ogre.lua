function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("yawns, and utters some gibberish, then falls back asleep.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1685})) then --Breath of Gwan
		e.self:SetAppearance(0);
		e.self:Say("Your path of wanton destruction ends here. Gwan and Eejag were impatient and hot-headed. You will not defeat me, for I have the patience and perseverance of stone, unlike the children you have beaten before me. Are you sure you want to challenge me?");
		eq.spawn2(107139,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Trunt
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------