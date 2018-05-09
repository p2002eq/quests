--#Trydan_Faye NPCID 211053
--Rydda`Dar - Trial #1(Flag only version - spawns after successful event)
--hohonora

local counter;

function event_spawn(e)
	eq.set_timer("depop",10*60*1000);	--10 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		e.self:Say("Congratulations on your victory my friends. You've passed this trial. There are two others that you must complete before you can step into the Temple of Marr.");
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_hoh_faye == nil and counter < 72 then
		e.other:Message(7,"An ethereal mist descends from the air and surrounds your very being. Your body begins to emanate with the power of Trydan Faye.");
		eq.set_global("pop_hoh_faye", "1", 5, "F");
		counter = counter + 1;
	end
end