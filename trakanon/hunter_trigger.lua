function event_spawn(e)
	eq.spawn2(95000,0,0,2832,1667,-375,0);
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
        local getnewloc = eq.ChooseRandom(1,2,3);
	        if(getnewloc == 1) then
		        newx = 2832;
		        newy = 1667;
		        newz = -375;
	        elseif(getnewloc == 2) then
		        newx = 1631;
		        newy = 3119;
		        newz = -339;
	        elseif(getnewloc == 3) then
		        newx = -319;
		        newy = 3040;
		        newz = -359;
	        end
	        
	   local getnewmobid = eq.ChooseRandom(95149, 95150, 95151, 95152, 95153, 95154, 95155, 95156, 95157, 95158, 95159, 95160, 95161, 95162, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004, 95004);
	        eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
    end
end