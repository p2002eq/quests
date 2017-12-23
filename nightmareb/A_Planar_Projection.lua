--A_Planar_Projection
--Terris Flag
--nightmareb

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);	--10 min depop
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_ponb_terris == nil and counter < 72 then
		e.other:Message(7,"You recognize the voice in your mind to be Thelin Poxbourne's.  The words echo, 'The cruel hand of Terris no longer shall torment my dreams.  Thank you friends, you are my savior.  Please return to me in the Plane of Tranquility.  I would like to express to you my gratitude.'");
		e.other:Message(15,"You receive a character flag!");
		eq.set_global("pop_ponb_terris", "1", 5, "F");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end


