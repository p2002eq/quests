--#Neffiken,_Lord_of_Kelek`Vor (210470)
--Forest Giant Lord
--Zone: Postorms

function event_spawn(e)
	activated = false;
	eq.set_next_hp_event(97);
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
		spawn_adds(e,3,7);	--spawn adds
	end
end

function deactivate(mob)
	activated = false;
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);	--will not aggro
	mob:SetSpecialAbility(35, 1);	--no harm from players
	mob:WipeHateList();
	mob:GotoBind();
end

function activate(mob)
	activated = true;
	mob:SetBodyType(1, true);		--humanoid
	mob:SetSpecialAbility(24, 0);	--will not aggro
	mob:SetSpecialAbility(35, 0);	--no harm from players
	eq.set_timer("monitor", 30 * 60 * 1000);	--remain untargetable for 30 minutes at a minimum.  after that point will go untargetable if spawnpoints repop and mob is not engaged
end


function trash_check()	--iterate through related NPC ids
	local mob_table = {210015,210038,210411};	--an_irmin_her_megir, an_irmin_fannsk, an_irmin_fannsk

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

function spawn_adds(e,low,high)
	local rand = math.random(low,high);
	for n = 1,high do
		mob = eq.spawn2(eq.ChooseRandom(210475,210476,210477),0,0,e.self:GetX() + math.random(-50,50),e.self:GetY() + math.random(-50,50),e.self:GetZ() - 10,e.self:GetHeading());	-- #a_manipulated_ent, #a_maligned_ent, #a_restrained_ent
		mob:AddToHateList(e.self:GetHateRandom(),1);
	end
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


