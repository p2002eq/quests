--#Councilor_Juliah_Lockheart (129102) 
--triggered version - depop script
--thurgadinb

function event_spawn(e)
	e.self:Say("FOOL! You've ruined everything!");
	e.self:Say("You'll pay with your life for meddling in the affairs of others!");
	eq.set_timer("depop", 10 * 60 * 1000);	--10 min depop
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("depop");
	else
		eq.set_timer("depop", 10 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end