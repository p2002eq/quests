function event_combat(e)
	if(e.joined) then
		local cur_target = e.self:GetHateTop();
		if(cur_target) then
			e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 16165})) then
		e.self:Say("Daleen sent you? She is so sweet. If she wasn't married.. ehem.. Thanks.");
		e.other:Faction(133, 5);
		e.other:Faction(208, 5);
		e.other:Faction(316, 5);
		e.other:Faction(218, 5);
		e.other:Faction(88, -10);
		e.other:GiveCash(0,0,1,0);
		e.other:AddEXP(500);
		e.other:Ding();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
