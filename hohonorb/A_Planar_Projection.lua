--A_Planar_Projection
--Lord Mith Marr
--hohonorb

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);	--10 min depop
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_hohb_marr == nil and counter < 72 then
			--e.other:Message(7,"The Planar Projection's thoughts enter your own.  'You have done well. You will now be able to enter the Halls of Honor.'");  --need to confirm text if available
			e.other:Message(15,"You receive a character flag!");
			eq.set_global("pop_hohb_marr", "1", 5, "F");
			counter = counter + 1;		
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

