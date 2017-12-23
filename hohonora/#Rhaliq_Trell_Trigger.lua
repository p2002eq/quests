local  villager = 0;
local  badguys = 0;

function event_spawn(e)
	eq.set_timer("hb",1);
end

function event_signal(e)
	if( e.signal == 1) then 
		 villager= villager + 1;
		eq.stop_timer("fail");
		eq.set_timer("fail",20*60*1000);  --reset timer for 20 min
	elseif( signal == 2) then
		 badguys= badguys + 1;
		eq.stop_timer("fail");
		eq.set_timer("fail",1200);	--reset timer for 20 min
	end
end

function event_timer(e)
	if( e.timer ==  "hb" and  villager == 4) then
		eq.update_spawn_timer(211050,86400000); --Rhaliq Trell 24 hours on fail
		villager = 0;
		badguys = 0;
		eq.stop_timer(2);
		eq.signal(211089);
		eq.signal(211090);
		eq.signal(211091);
		eq.signal(211092);
		eq.signal(211093);
		eq.signal(211094);
		eq.signal(211095);
		eq.signal(211096);
		eq.signal(211097);
		eq.signal(211098);
		eq.signal(211099);
		eq.signal(211100);
		eq.signal(211101);
		eq.signal(211102);
		eq.signal(211103);
		eq.signal(211104);
	elseif( e.timer == "hb" and badguys == 9) then
		eq.spawn2(211105,0,0,456,1374,-133,65.5); --hail version of Rhaliq
		eq.update_spawn_timer(211050,259200000); --Rhaliq Trell 3 days on win
		villager = 0;
		badguys = 0;
		eq.stop_e.timer(2);
		eq.signal(211089);
		eq.signal(211090);
		eq.signal(211091);
		eq.signal(211092);
		eq.signal(211093);
		eq.signal(211094);
		eq.signal(211095);
		eq.signal(211096);
		eq.signal(211097);
		eq.signal(211098);
		eq.signal(211099);
		eq.signal(211100);
		eq.signal(211101);
		eq.signal(211102);
		eq.signal(211103);
		eq.signal(211104);
	elseif( e.timer == "fail") then
		eq.update_spawn_timer(211050,86400000); --Rhaliq Trell 24 hours on fail
		villager = 0;
		badguys = 0;
		eq.signal(211089);
		eq.signal(211090);
		eq.signal(211091);
		eq.signal(211092);
		eq.signal(211093);
		eq.signal(211094);
		eq.signal(211095);
		eq.signal(211096);
		eq.signal(211097);
		eq.signal(211098);
		eq.signal(211099);
		eq.signal(211100);
		eq.signal(211101);
		eq.signal(211102);
		eq.signal(211103);
		eq.signal(211104);
	end
end