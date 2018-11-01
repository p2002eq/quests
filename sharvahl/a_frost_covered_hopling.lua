function event_spawn(e)
	eq.set_timer("depop",300000);  --5 min depop
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.depop();
	end
end