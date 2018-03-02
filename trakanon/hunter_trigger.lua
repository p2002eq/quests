function event_spawn(e)
	eq.signal(95178, 1) -- signals itself to start cycle
end

function event_signal(e)
    --eq.zone_emote(12, "Signaled:" .. e.signal);
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
	    
		local new_mob = 95000;
		if(math.random(100) > 66) then
			new_mob = eq.ChooseRandom(95163, 95164, 95165, 95166, 95167, 95168, 95169, 95170, 95171, 95172, 95173, 95174, 95175, 95176);
		end

		eq.spawn2(new_mob,1,0.0,newx,newy,newz,0);
    end
end
