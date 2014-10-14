-- --20451 : nuien : gives 20451 & spawns Teola
local move;

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20451})) then
		e.self:Say("So be it. Do as you have done before and find the next. Teloa is the last.");
		e.other:SummonItem(20451);
		eq.spawn2(15170,0,0,-2854,-3840,126.5,61.8); --spawn teola
		eq.signal(15044,15167,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 99) then
		e.self:Emote("growls as his power seeps into the earth.");
	else
		e.self:MoveTo(-1590,-3671,-18);
		move = 1;
	end
end

function event_waypoint_depart(e)
	if(move == 1) then
		eq.depop();
		eq.spawn2(15167,0,0,-1590,-3671,-18,0);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
