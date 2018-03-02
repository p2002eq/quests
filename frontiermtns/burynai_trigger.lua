-- Goblin cycle, involving the Giants, Burynai, and the goblin coward.

function event_spawn(e)
	--eq.spawn2(950.000,0,0,2832,1667,-375,0);
	
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
        local getnewloc = eq.ChooseRandom(1,2);
	        if(getnewloc == 1) then
		        newx = -3134;
		        newy = -2100;
		        newz = -374;
	        elseif(getnewloc == 2) then
		        newx = -2100;
		        newy = -2500;
		        newz = -400;
	        end
	        
	   local getnewmobid = eq.ChooseRandom(92197, 92198, 92199, 92200, 92201, 92202, 92203, 92204, 92205, 92206, 92207);
	        eq.spawn2(getnewmobid,0.0,0,newx,newy,newz,0);
    end
end
