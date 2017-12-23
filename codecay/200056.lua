--Summoner of Bertox trigger mob

function event_signal(e)
	if e.signal == 1 then
		eq.set_timer("20",7400);
		eq.set_timer("21",300);	
	elseif e.signal == 8 then
		eq.depop_with_timer();
	end
end
	
function event_timer(e)
	if e.timer == "20" then
		eq.signal(200042);
		eq.signal(200043);
		eq.signal(200044);
		eq.signal(200045);
		eq.signal(200046);
		eq.signal(200047);
		eq.signal(200048);
		eq.signal(200049);
		eq.signal(200050);
		eq.signal(200051);
		eq.signal(200052);
		eq.signal(200053);
		eq.signal(200054);
		eq.signal(200055);
		eq.signal(200022);
		eq.signal(200056);
	elseif e.timer == "21" then
		eq.spawn2(200044,0,0,0,280,-244,0);
		eq.stop_timer(e.timer);
	end
end