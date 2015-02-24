local count = 0;
function event_spawn(e)
	eq.set_timer("themoor",5000);
end

function event_timer(e)
	count = count + 1;
	if(count == 1) then
		e.self:Say("So mate, are you just in from a patrol?");
	end
	if(count == 2) then
		eq.signal(155122,1,1);
	end
	if(count == 3) then
		eq.signal(155259,1,1);
	end
	if(count == 4) then
		eq.signal(155122,2,1);
	end
	if(count == 5) then
		e.self:Say("Sure thing, mate. You know I'm sucker for good gossip.");
	end
	if(count == 6) then
		eq.signal(155122,3,1);
	end
	if(count == 7) then
		e.self:Say("Oh my! Did ya kill 'em!");
		eq.signal(155259,2,1);
	end
	if(count == 8) then
		eq.signal(155122,4,1);
	end
	if(count == 9) then
		e.self:Say("Bah! It couldn't get weirder. That's weird enough! Take a moment to finish your drink and then tell me what happened.");
		eq.set_timer("themoor",300000);
	end
	if(count == 10) then
		count = 0;
		eq.set_timer("themoor",5000);
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
