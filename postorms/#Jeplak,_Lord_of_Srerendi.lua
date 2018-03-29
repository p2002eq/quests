--#Jeplak,_Lord_of_Srerendi (210471)
--Zone: Postorms

local guards={}

function event_spawn(e)
	activated = false;
	guards[1] = eq.spawn2(eq.ChooseRandom(210056,210099,210419),0,0,390,-2921,-455,254);
	guards[2] = eq.spawn2(eq.ChooseRandom(210056,210099,210419),0,0,310,-2921,-455,254);
end

function event_combat(e)
	if e.joined then
		eq.set_timer("adds", 30 * 1000);
	else
		eq.stop_timer("adds");
	end
end

function event_signal(e)-- Signal from the death of any appropriate named or trash
	if not trash_check() and not activated then
		activate(e.self);	--activate if trash is cleared
	end
end

function event_timer(e)
	if e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			deactivate(e.self);
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 15 * 1000);
		end
	elseif e.timer == "adds" and e.self:IsEngaged() and player_check(e) then
		eq.stop_timer(e.timer);
		eq.set_timer("adds", 60 * 1000);
		spawn_adds(e,2,8);	--spawn adds
	end
end

function event_slay(e)
	if e.other:IsClient() or e.other:IsPet() then
		spawn_adds(e,2,2);	--2 adds on death always
	end
end

function event_death_complete(e)
	eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,300,"As the corpse of Jeplak crashes to the ground, you notice a slight, deranged smile on his face.");
end

function deactivate(mob)
	activated = false;
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
	mob:GotoBind();
end

function activate(mob)
	activated = true;
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);	
	eq.set_timer("monitor", 30 * 60 * 1000);	--remain untargetable for 30 minutes at a minimum.  after that point will go untargetable if spawnpoints repop and mob is not engaged
end

function spawn_adds(e,low,high)
	local rand = math.random(low,high);
	for n = 1,high do
		mob = eq.spawn2(eq.ChooseRandom(210474,210473),0,0,e.self:GetX() + math.random(-50,50),e.self:GetY() + math.random(-50,50),e.self:GetZ() - 10,e.self:GetHeading());	--#a_lost_soul or #a_mangled_traveller
		mob:AddToHateList(e.self:GetHateRandom(),1);
	end
end

function trash_check()	--iterate through related spawnpoints for both Jeplak camps
	local spawn_table = {346712,346713,346714,346715,346716,346717,346718,346719,346720,346721,346722,346730,346376,346377,346379,346378,346380,346381,346382,346383,346384,346385};

	for _,spawns in pairs(spawn_table) do
		local giant = eq.get_entity_list():GetSpawnByID(spawns);
		
		if giant:NPCPointerValid() then
			return true;
		end
	end
	
	for n = 1,2 do
		local mob_list = eq.get_entity_list():GetMobList()
		
		if mob_list ~= nil then
			for mob in mob_list.entries do
				if mob:GetID() == guards[n]:GetID() then
					return true;
				end
			end
		end
	end
			
	return false;
end

function player_check(e)
	client_list = eq.get_entity_list():GetClientList();
	
	if client_list ~= nil then
		for client in client_list.entries do
			if client:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 30 and not client:GetFeigned() then	--checks client in range and not FD (to not spawn mobs during pull/split)
				return true; --client in range
			end
		end
	end
	return false;
end
