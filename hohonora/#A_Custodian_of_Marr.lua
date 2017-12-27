function event_spawn(e)
	eq.set_timer("depop",2*60*60*1000);	--2hr timer
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

