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
	if(item_lib.check_turn_in(e.trade, {item1 = 18013})) then
		e.self:Say("What's this?  Oh dear.  I am very sorry.  Please take this to Uner with my apologies.");
		e.other:SummonItem(13240);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
