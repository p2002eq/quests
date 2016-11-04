function event_spawn(e)
	eq.spawn2(95004,0,0,3552,725,-392,0);
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
       local getnewloc = eq.ChooseRandom(1,2,3);
	        if(getnewloc == 1) then
		        newx = -66;
		        newy = 1034;
		        newz = -347;
	        elseif(getnewloc == 2) then
		        newx = 811;
		        newy = 2068;
		        newz = -370;
	        elseif(getnewloc == 3) then
		        newx = 3552;
		        newy = 725;
		        newz = -392;
	        end
	        
	        
	   local getnewmobid = eq.ChooseRandom(95149, 95150, 95151, 95152, 95153, 95154, 95155, 95156, 95157, 95158, 95159, 95160, 95161, 95162, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004);
	        eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
    end
end


