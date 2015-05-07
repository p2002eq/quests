-- Goblin cycle, involving the Giants, Burynai, and the goblin coward.

function event_spawn(e)
	--eq.spawn2(95000,0,0,2832,1667,-375,0);
	
end

function event_signal(e)
    eq.zone_emote(12, "Signaled:" .. e.signal);
    if(e.signal == 1) then --mob died
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
	        eq.spawn2(getnewmobid,0,0,newx,newy,newz,0);
    end
end