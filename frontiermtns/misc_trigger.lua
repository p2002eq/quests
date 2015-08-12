-- Brute cycle, involving the Brutes, Misc, and the Sarnak.

function event_spawn(e)
	--eq.spawn2(95000,0,0,2832,1667,-375,0);
	
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
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
	        eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
    end
end