-- Brute cycle, involving the Brutes, Misc, and the Sarnak.

function event_spawn(e)
	--eq.spawn2(95000,0,0,2832,1667,-375,0);
	
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
        local getnewloc = eq.ChooseRandom(1,2);
	        if(getnewloc == 1) then
		        newx = -2914;
		        newy = -2971;
		        newz = -478;
	        elseif(getnewloc == 2) then
		        newx = -3388;
		        newy = -1875;
		        newz = -321;
	        end
	        
	   local getnewmobid = eq.ChooseRandom(92233, 92234, 92235, 92236, 92237, 92238, 92239, 92240, 92241, 92242, 92243);
	        eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
    end
end