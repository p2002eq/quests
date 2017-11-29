--AOE_Trigger (invis mob at Manaetic Behemoth spawnpoint)		
--NPCID: 206206

local spider_locs =  { [1] = {804, -286, 5, 64},[2] = {1446, -286, 5, 192}, [3] = {802, 286, 5, 64}, [4] = {1446,286,5,192} };
local spider_grids = {36,38,37,39}; --stagger spawnpoints for 1 on each side
local counter;


function event_spawn(e)
	eq.set_timer("spiders", 3 * 1000);		--start spider cycle
	eq.set_timer("AE_check", 1);		--checks for spiders within distance
	counter = 0;
end


function event_timer(e)
	if e.timer == "spiders" then
		counter = counter + 1;
		eq.spawn2(206001,spider_grids[counter],0,unpack(spider_locs[counter]));		--spawns a_clockwork_device 
		if counter == 4 then
			counter = 0;  --reset counter
		end
		eq.set_timer("spiders",math.random(2,3) * 1000);	
	elseif e.timer == "AE_check" then
		local npc_list = eq.get_entity_list():GetNPCList();
	
		if(npc_list ~= nil) then
			for npc in npc_list.entries do								 
				if npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 5 and npc:GetNPCTypeID() == 206001  then  --and (eq.get_entity_list():IsMobSpawnedByNpcTypeID(206046)
					npc:SpellFinished(2321,e.self);
					eq.signal(206046,1);  --signal MB that AE has went out.  Will reset activation timer
					npc:Depop();
				end
			end
		end
	end
end