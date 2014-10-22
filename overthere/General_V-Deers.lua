function event_signal(e)
	if(e.signal==1) then
		eq.depop_with_timer();
	end
	if(e.signal==2) then
		e.self:MoveTo(2717,2500,-49,65,1);
		eq.set_timer("getset",525000);
	end
end

function event_timer(e)
	eq.stop_timer("getset");
	e.self:Say("Dragoons!!  Attention!!  Right face!!");
	eq.start(277);
end

function event_waypoint_arrive(e)
	if(e.wp==1) then
		e.self:Say("Forward.. march!!  Your left.. Your.. left, right, march!  Eighty.. second.. dragoon soldier!!  Pick up your weapon and follow me!!");
		eq.signal(93186,3);
		eq.signal(93124,3);
		eq.signal(93088,3);
		eq.signal(93084,3);
		eq.signal(93125,3);
		eq.signal(93086,3);
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
