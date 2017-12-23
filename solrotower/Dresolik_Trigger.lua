local dresolik = 0;

function event_signal(e)
	dresolik = dresolik + 1;
	eq.stoptimer("reset");
	eq.set_timer("reset",2*60*60*1000); --if group leaves and only kills 1-2 mobs, the variable will be reset after 2 hours and no mobs killed
	if dresolik == 4 then
		eq.spawn2(212061,0,0,607,1585,-162,63);
		dresolik = 0;
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer(e.timer)
		dresolik = 0;
	end
end