function event_spawn(e)
	eq.set_timer("depop",1200000); -- 20 Minutes
	e.self:Say("You will never take me alive!!");
end

function event_timer(e)
	eq.depop();
end

function event_death_complete(e)
	e.self:Say("hisss.. You will never stop the.. Radiant.. Green..");
end