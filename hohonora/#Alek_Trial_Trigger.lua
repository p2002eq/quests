local varone = 0;
local vartwo = 0;
local varthree = 0;
local roomone = 0;
local roomtwo = 0;
local roomthree = 0;
local boss = 0;

function event_spawn(e)
	eq.set_timer("1",1);
end


function event_timer(e)
	if(e.timer == 1 and ( varone == 3 or  vartwo == 3 or  varthree == 3)) then
		eq.signal(211077);
		eq.signal(211078);
		eq.signal(211079);
		eq.signal(211080);
		eq.signal(211083);
		eq.signal(211082);
	elseif(e.timer == 1 and  roomone == 5) then
		eq.spawn2(211085,0,0,-2349,-1894,-113,233);
		 roomone = 0;
	elseif(e.timer == 1 and  roomtwo == 5) then
		eq.spawn2(211084,0,0,-3337,-1617,-113,76.2);
		 roomtwo = 0;
	elseif(e.timer == 1 and  roomthree == 5) then
		eq.spawn2(211086,0,0,-2996,-991,-113,153);
		 roomthree = 0;
	elseif(e.timer == 1 and  boss == 2) then
		eq.signal(211085,1,1);
		eq.signal(211084,1,1);
		eq.signal(211086,1,1);
	elseif(e.timer == "fail") then
		eq.update_spawn_timer(211060,86400000); --Alekson Garn 24 hours on fail
		eq.signal(211085,1);
		eq.signal(211084,1);
		eq.signal(211086,1);
		eq.signal(211080,1);
		eq.signal(211082,1);
		eq.signal(211083,1);
		eq.signal(211087,1);
		eq.signal(211088,1);
		eq.signal(211089,1);
		roomone = 0;
		roomtwo = 0;
		roomthree = 0;
		varone = 0;
		vartwo = 0;
		varthree = 0;
	end
end

function event_signal(e)
	if( e.signal == 1) then
		varone= varone + 1;
	elseif(e.signal == 2) then
		vartwo= vartwo + 1;
	elseif(e.signal == 3) then
		varthree= varthree + 1;
	elseif(e.signal == 4) then
		eventstart = 1;
		eq.set_timer("fail",7200);
	elseif(e.signal == 5) then
		roomone= roomone + 1;
		eq.set_timer("fail",7200);
	elseif(e.signal == 6) then
		roomtwo= roomtwo + 1;
		eq.set_timer("fail",7200);
	elseif(e.signal == 7) then
		roomthree= roomthree+1;
		eq.set_timer("fail",7200);
	elseif(e.signal == 8) then
		boss= boss + 1;
		eq.set_timer("fail",7200);
	elseif(e.signal == 9) then
		boss = 0;
	end
end