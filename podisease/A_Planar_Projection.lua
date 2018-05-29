--A_Planar_Projection
--Grummus Flag
--Podisease

local counter;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);	--10 min depop
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_pod_grimmus_planar_projection == nil and counter < 72 then
		e.other:Message(7,"You recognize the sound of the voice echoing in your mind to be Milyk Fuirstel's.  Before fading, he tells you, 'I beg of you, return to me with the ward that now envelops your body.  This etheric energy is the only thing that can stop the plague that has been placed upon me.");
		e.other:Message(4,"You've received a character flag!");
		eq.set_global("pop_pod_grimmus_planar_projection", "1", 5, "F");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
