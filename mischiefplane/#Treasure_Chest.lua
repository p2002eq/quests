--Treasure Chest (NPC ID #126188)
--Plane of Mischief 1.0

--Script for causing aggro of guards when attacking NPC
--             Nupple  Dupple  Snitch  Blich  Plupple  Krupple  Stitch  Kitch
local guard_list = { 126614, 126613, 126615, 126616, 126617, 126618, 126619, 126620 };
local GuardsSpawned = 0;


function spawn_guards(e)  -- function to spawn guard list upon chest being aggroed
	local x = {-478,-441,-342,-312,-312,-342,-441,-478}; 
	local y = {47,17,17,47,148,180,180,148}; 
	local z = {118,118,118,118,118,118,118,118}; 
	local h = {65,255,255,192,192,127,127,65}; 
	local count = 1;
	
	while (guard_list[count] ~= nil) do 
		eq.spawn2(guard_list[count],0,0,x[count],y[count],z[count],h[count]);
		count = count + 1;
	end
	count = 1;
	GuardsSpawned = 1;
end

function depop(e)
	local d_count = 1;
	while (guard_list[d_count] ~= nil) do
		eq.depop_all(guard_list[d_count])	--despawns all guards
		d_count = d_count + 1;
	end
	
end
	

function event_spawn(e)
	depop(e);	-- depop guards if already up
	GuardsSpawned = 0;  -- reset script to allow guards to be spawned only once
	
end



function event_timer(e)
	if e.timer == 'aggro_guards' then
		aggro_guards(e.self:GetHateRandom());
	elseif (e.timer == 'depop') then
		depop(e);
		eq.depop_with_timer();	--despawns treasure chest with timer
	end
end


function aggro_guards(mob, e) 
	local counter = 0;
	local add_match = 0;
	while (add_match == 0 and counter < 200) do   -- runs loop till match found or 200 attempts at finding match.  Loop exits after 200 tries
		n = math.random(1,8);	--randomly select guard mob to assist Treasure Chest
		local guard_mob = eq.get_entity_list():GetNPCByNPCTypeID(guard_list[n]);
		if (guard_mob ~=nil and guard_mob:IsEngaged() == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(guard_list[n]) == true) then 
			add_match = 1;
			guard_mob:Shout("MINE!!!");
			guard_mob:AddToHateList(mob);
		end
		counter = counter + 1;
	end
end

function event_combat(e)
	if (e.joined) then
		spawn_guards(e);
		aggro_guards(e.self:GetHateRandom());
		eq.set_timer('aggro_guards',10*1000);
	else
		eq.stop_timer('aggro_guards');
		eq.set_timer("depop",10*1000);  -- 10 second delay upon losing aggro then despawn function triggered
	end
end


