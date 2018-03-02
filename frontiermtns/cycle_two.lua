function event_spawn(e)
	local trigger = eq.ChooseRandom(1,2,3);
	        if(trigger == 1) then  -- goblin trigger
                local getnewloc = eq.ChooseRandom(1,2);
	                if(getnewloc == 1) then
		                newx = 3150;
		                newy = -2112;
		                newz = 308;
	                elseif(getnewloc == 2) then
		                newx = 2371;
		                newy = -3013;
		                newz = 313;
	                end
	        
	            local getnewmobid = eq.ChooseRandom(92176, 92222, 92223, 92224, 92225, 92250);
	                eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
	        elseif(trigger == 2) then  -- giant trigger
		        local getnewloc = eq.ChooseRandom(1,2);
	                if(getnewloc == 1) then
		                newx = -2914;
		                newy = -2971;
		                newz = 378;
	                elseif(getnewloc == 2) then
		                newx = -3388;
		                newy = -1875;
		                newz = 321;
	                end
	        
	            local getnewmobid = eq.ChooseRandom(92233, 92234, 92235, 92236, 92237, 92238, 92239, 92240, 92241, 92242, 92243);
	                eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
	        elseif(trigger == 3) then -- burynai trigger
		        local getnewloc = eq.ChooseRandom(1,2);
	                if(getnewloc == 1) then
		                newx = 2014;
		                newy = 3167;
		                newz = 274;
	                elseif(getnewloc == 2) then
		                newx = 3019;
		                newy = 2328;
		                newz = 203;
	                end
	        
	            local getnewmobid = eq.ChooseRandom(92226, 92240, 92228, 92229, 92230, 92231, 92232);
	                eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
	        end
end
