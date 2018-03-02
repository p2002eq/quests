-- Brute cycle, involving the Brutes, Misc, and the Sarnak.

function event_spawn(e)
	--eq.spawn2(950.000,0,0,2832,1667,-375,0);
	
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
        local getnewloc = eq.ChooseRandom(1,2);
	        if(getnewloc == 1) then
		        newx = 3150;
		        newy = -2112;
		        newz = -408;
	        elseif(getnewloc == 2) then
		        newx = 2371;
		        newy = -3013;
		        newz = -513;
	        end
	        
	   local getnewmobid = eq.ChooseRandom(92176, 92222, 92223, 92224, 92225, 92250);
	        eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
    end
end
