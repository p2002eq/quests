--#Alekson_Garn (NPCID: 211061)
--Trial of Maidens (Flag only version - spawns after successful event)
--hohonora

local counter;

function event_spawn(e)
	counter = 0;
	eq.set_timer("depop", 10 * 60 * 1000);
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("Hail") and qglobals.pop_hoh_garn == nil and counter < 72 then
		e.other:Message(7,"An ethereal mist descends from the air and surrounds your very being. Your body begins to emanate with the power of Alekson Garn.");
		eq.set_global("pop_hoh_garn", "1", 5, "F");
		counter = counter + 1;
	end
end

function event_timer(e)
	if e.timer == "depop" then	--only depops on successful event
		e.self:Say("Congratulations my friends. You've passed the trial I laid before you.");
		eq.unload_encounter("Alekson_Trial");
		eq.depop_with_timer();
	end
end