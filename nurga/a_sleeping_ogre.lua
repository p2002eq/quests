-- Monk Epic 1.0
function event_spawn(e)
	eq.set_timer("appearance", 1000);
end

function event_timer(e)
	eq.stop_timer("appearance");
	e.self:SetAppearance(3);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("snorts a bit and continues sleeping.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.self, e.trade, {item1 = 1685})) and (e.other:GetLevel() > 45) and (e.other:GetClass() == 7)) then --Breath of Gwan
		e.self:SetAppearance(0);
		e.self:Say("Your path of wanton destruction ends here. Gwan and Eejag were impatient and hot-headed. You will not defeat me, for I have the patience and perseverance of stone, unlike the children you have beaten before me. Are you sure you want to challenge me?");
		eq.spawn2(107000,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()):AddToHateList(e.other,1); --Trunt
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
