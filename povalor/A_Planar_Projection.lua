--A_Planar_Projection
--Aerin`Dar/hohonora
--povalor

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);	--10 min depop
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_pov_aerin_dar == nil and counter < 72 then
		if qglobals.pop_poj_valor_storms ~= nil then	--check Mavuin flag has been completed
			e.other:Message(7,"The Planar Projection's thoughts enter your own.  'You have done well. You will now be able to enter the Halls of Honor.'");
			e.other:Message(15,"You receive a character flag!");
			eq.set_global("pop_pov_aerin_dar", "1", 5, "F");
			counter = counter + 1;
		else
			e.other:Message(7,"The Planar Projection's thoughts enter your own.  'You have done well, but you cannot enter the Halls of Honor on your own until you have demonstrated your sense of Justice as well as Honor.'");
			e.other:Message(15,"You receive a character flag!");
			eq.set_global("pop_pov_aerin_dar", "1", 5, "F");
			counter = counter + 1;
		end
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

