local counter = 0;

function event_spawn(e)
	eq.set_timer("depop", 10 * 60 * 1000);
	counter = 0;
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and counter < 72 and qglobals.pop_bot_agnarr == nil then
		eq.set_global("pop_bot_agnarr", "1", 5, "F");
		e.other:Message(4,"You receive a character flag!");
		e.other:Message(7,"Very good mortal... visit Karana upstairs.");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end