function event_spawn(e)
	e.self:Say("Anyone need a banker?");
	eq.set_timer("depop",600000); 
end

function event_timer(e)
	if (e.timer == "depop") then
		e.self:Say("Welp, see ya later!");
		eq.depop();
	end
end