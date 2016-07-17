-- --20450 : sionae : gives 20451 & spawns nuien
local move;

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.self, e.trade, {item1 = 20450})) then
		e.self:Say("I see that the time has come. Take the amulet and give it to the third of our kin, Nuien. I will meet you at the gathering.");
		e.other:SummonItem(20451);
		eq.spawn2(15167,0,0,300,-3657,3,183); --spawn nuien
		eq.move_to(-1584,-3669,-18, 0, true);
--		
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 99) then
		e.self:Emote("shivers as her power flows into the air above the gathering.");
	end
end

function event_waypoint_arrive(e)
	eq.signal(15044,1,0);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
