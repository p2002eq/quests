local start;
local timer;
local move;
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20451})) then
		e.self:Emote("begins walking toward the gathering spot. 'Follow, friend.'");
		start = eq.get_entity_list():GetMobByNpcTypeID(15044);
		timer = start:CastToNPC();
		timer:SignalNPC(1); -- start the timers on althele
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 99) then
		e.self:Emote("breathes slowly as tendrils of power emanate from her body and race along the ground.");
	else
		e.self:MoveTo(-1597,-3670,-18);
		move = 1;
	end
end

function event_waypoint_depart(e)
	if(move == 1) then
		eq.depop();
		eq.spawn2(15170,0,0,-1597,-3670,-18,0);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
