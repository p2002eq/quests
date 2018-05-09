--#Rhaliq_Trell_ NPCID 211052
--Villager's Trial(Flag only version - spawns after successful event)
--hohonora

local counter;

function event_spawn(e)
	eq.set_timer("depop",10*60*1000);	--10 min depop
	counter = 0;
end

function event_timer(e)
	if e.timer == "depop" then
		e.self:Say("Congratulations on your victory.");
		eq.unload_encounter("Rhaliq_Trial");
		eq.depop();
	end
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	if e.message:findi("hail") and qglobals.pop_hoh_trell == nil and counter < 72 then
		e.other:Message(7,"An ethereal mist descends from the air and surrounds your very being. Your body begins to emanate with the power of Rhaliq Trell.");
		eq.set_global("pop_hoh_trell", "1", 5, "F");
		counter = counter + 1;
	end
end