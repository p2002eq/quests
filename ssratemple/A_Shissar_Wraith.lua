--A_Shissar_Wraith (162491)
--spawns on death of Emperor_Ssraeshza (162504) (Key to Vex Thal)
--zone:ssratemple

function event_spawn(e)
	eq.set_timer("depop", 30 * 60 * 1000);	--30 min depop
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end