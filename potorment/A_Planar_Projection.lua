--A_Planar_Projection (221045)
--Plane of Torment

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000) -- 10 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);
	if e.message:findi("hail") and qglobals.pop_pot_saryrn == nil and counter < 72 then
		eq.set_global("pop_pot_saryrn", "1", 5, "F");
		e.other:Message(7,"The Planar Projection's thoughts enter your own. 'You have done well, now receive the knowledge that Saryrn once held!' You look down at your arms to see a set of unintelligible runes being burnt into your arms. The pain is terrible and searing. Suddenly the sensation is gone and the runes slowly fade.");
		e.other:Message(15,"You've received a character flag!");
		counter = counter + 1;
	end
end

