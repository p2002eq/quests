-- Rogue Epic NPC -- --Ioltos_V'ghera

function event_say(e)
	e.self:Emote("ignores you.");
end


function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 28057})) then
		
		e.self:Say("The General will take care of you!");
		
		e.other:Ding();
		
		e.other:AddEXP(500);
		
		eq.spawn2(20205,0,0,2316,797,275,193.5);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end



--END of FILE  Quest by: Solid11  Zone:kithicor  ID:20062 -- --Ioltos_V'ghera




-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
