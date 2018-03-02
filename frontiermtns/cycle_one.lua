function event_spawn(e)
	local trigger = eq.ChooseRandom(1,2,3);
	        if(trigger == 1) then  -- goblin trigger
                local getnewloc = eq.ChooseRandom(1,2);
	                if(getnewloc == 1) then
		                newx = 1200;
		                newy = -3332;
		                newz = -474;
	                elseif(getnewloc == 2) then
		                newx = 1727;
		                newy = -2917;
		                newz = -560;
	                end
                local getnewmobid = eq.ChooseRandom(92249, 92208, 92209, 92210, 92211, 92212);
	                    eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
	        elseif(trigger == 2) then  -- giant trigger
		        local getnewloc = eq.ChooseRandom(1,2);
	                if(getnewloc == 1) then
		                newx = 2879;
		                newy = 1870;
		                newz = 152;
	                elseif(getnewloc == 2) then
		                newx = 3416;
		                newy = 2013;
		                newz = 194;
	                end
	        
	            local getnewmobid = eq.ChooseRandom(92213, 92214, 92215, 92216, 92217, 92218, 92219, 92220);
	                eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
	        elseif(trigger == 3) then -- burynai trigger
		        local getnewloc = eq.ChooseRandom(1,2);
	                if(getnewloc == 1) then
		                newx = 2889;
		                newy = -1784;
		                newz = -290;
	                elseif(getnewloc == 2) then
		                newx = -2111;
		                newy = -2645;
		                newz = 192;
	                end
	        
	            local getnewmobid = eq.ChooseRandom(92197, 92198, 92199, 92200, 92201, 92202, 92203, 92204, 92205, 92206, 92207);
	                eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
	        end
end
