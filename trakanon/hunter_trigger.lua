function event_spawn(e)
	eq.spawn2(95000,0,0,3552,725,-392,0);
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
        local getnewloc = eq.ChooseRandom(1,2,3,4,5,6);
	        if(getnewloc == 1) then
		        newx = 1271.88;
		        newy = -1461.88;
		        newz = -284.75;
	        elseif(getnewloc == 2) then
		        newx = 4264.87;
		        newy = 2517;
		        newz = -334.4;
	        elseif(getnewloc == 3) then
		        newx = 1402;
		        newy = 2378;
		        newz = -235.4;
	        elseif(getnewloc == 4) then
		        newx = 3341;
		        newy = 2364;
		        newz = -331.63;
	        elseif(getnewloc == 5) then
		        newx = 1198;
		        newy = -1997;
		        newz = -311.5;
	        elseif(getnewloc == 6) then
		        newx = 1543;
		        newy = -2037;
		        newz = -319.5;
	        end
	        
	   local getnewmobid = eq.ChooseRandom(95149, 95150, 95151, 95152, 95153, 95154, 95155, 95156, 95157, 95158, 95159, 95160, 95161, 95162, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004);
	        eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
    end
end