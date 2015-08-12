-- Goblin cycle, involving the Giants, Burynai, and the goblin coward.

function event_spawn(e)
	--eq.spawn2(95000,0,0,2832,1667,-375,0);
	
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
        local getnewloc = eq.ChooseRandom(1,2);
	        if(getnewloc == 1) then
		        newx = 2803;
		        newy = 1827;
		        newz = 99;
	        elseif(getnewloc == 2) then
		        newx = 3416;
		        newy = 2013;
		        newz = 172;
	        end
	        
	   local getnewmobid = eq.ChooseRandom(92213, 92214, 92215, 92216, 92217, 92218, 92219, 92220);
	        eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
    end
end