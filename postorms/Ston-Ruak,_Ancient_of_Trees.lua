--#Drornok_Tok_Vo`Lok
--Zone: Postorms

local guards = {-1,-1,-1,-1,-1,-1}

function event_spawn(e)
	eq.set_timer("monitor", 30 * 60 * 1000);
end	

function event_combat(e)
	if e.joined then
		eq.stop_timer("monitor");
		eq.set_timer("adds", 15 * 1000);
	else
		eq.set_timer("monitor",15 * 60 * 1000);
		eq.stop_timer("adds");
	end
end

function event_timer(e)
	if e.timer == "monitor" then
		if trash_check() and not e.self:IsEngaged() then
			eq.get_entity_list():GetSpawnByID(369021):Repop(5); --#Ston_trigger (210479)
			eq.depop();
		else
			eq.stop_timer(e.timer);
			eq.set_timer("monitor", 15 * 1000);
		end
	elseif e.timer == "adds" then
		spawn_guards(e);
	end
end

function get_guard()
	totem = eq.ChooseRandom(210462,210463);	--a_Koka`Vor_advisor (210462), a_Koka`Vor_bark_spirit (210463)
	return totem;
end

function trash_check()	--iterate through related NPC ids
	local mob_table = {210088,210087,210464};	--a_Koka`Vor_krovian (210088), a_Koka`Vor_senvar (210087), a_Koka`Vor_Chieftain (210464)

	for _,mobs in pairs(mob_table) do
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(mobs) then
			return true;
		end
	end			
	return false;
end

function spawn_guards(e)		
	for n = 1,6 do
		match_found = false;	--reset for each loop
		local mob_list = eq.get_entity_list():GetMobList()
		
		if mob_list ~= nil then
		
			for mob in mob_list.entries do
				if guards[n] ~= -1 and guards[n].valid and mob:GetID() == guards[n]:GetID() then
					match_found = true;
				end
			end
		end
		if not match_found then
			guards[n] = eq.spawn2(get_guard(),0,0,e.self:GetX() + math.random(-40,40), e.self:GetY() + math.random(-40,40), e.self:GetZ(), e.self:GetHeading());	--spawn or repop guards
		end
	end
end
