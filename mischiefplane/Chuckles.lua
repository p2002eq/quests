--Chuckles (Dancing Rat)
--Plane of Mischief 1.0

--Reference to content:  http://everquest.allakhazam.com/db/npc.html?id=6784
--will randomly dance (even when in combat!)


local count = 0;

function dance()
	eq.set_timer("dance", 800); -- dance intervals
end

function event_spawn(e)
	dance();  -- start dance
end


function event_timer(e)
	if (e.timer == "dance" and count <= 10) then
		e.self:DoAnim(34);
		count = count + 1;
	else
		--e.self:Say("taking a break!"); --debug line
		eq.set_timer("break",10*1000);
		eq.stop_timer("dance");		
	end
	
	if (e.timer == "break") then 
		--e.self:Say("time to dance again!"); --debug line
		eq.stop_timer("break");
		count = 0;		--reset intervals
		dance();
	end	
end


--standard item return

function event_trade(e)
    local item_lib = require("items");
    item_lib.return_items(e.self, e.other, e.trade)
end