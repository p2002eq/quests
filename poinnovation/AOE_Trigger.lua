--AOE_Trigger (invis mob at Manaetic Behemoth spawnpoint)		
--NPCID: 206206

local spider_locs =  { [1] = {804, -286, 5, 64},[2] = {1446, -286, 5, 192}, [3] = {802, 286, 5, 64}, [4] = {1446,286,5,192} };
local spider_grids = {36,38,37,39}; --stagger spawnpoints for 1 on each side
local counter;


function event_spawn(e)
	eq.set_timer("spiders", 1 * 1000);		--start spider cycle
	counter = 0;
end


function event_timer(e)
	if e.timer == "spiders" then
		counter = counter + 1;
		eq.spawn2(206001,spider_grids[counter],0,unpack(spider_locs[counter]));		--spawns a_clockwork_device 
		if counter == 4 then  --debug
			counter = 0;  --reset counter
		end
		eq.set_timer("spiders",math.random(4,8) * 1000);	
	end
end

function event_signal(e)
	if e.signal == 1 then
		eq.set_timer("spiders",1 * 1000);	--signal from MB spawn to ensure spider timer is started
	end
end