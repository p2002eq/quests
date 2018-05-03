--Mujaki_The_Devourer
--NPCID: 204039
--Ponightmare

local loaded;

function event_spawn(e)
	loaded = false;
	depop_guards(100,1200,-3050,-2000);	--incase remained up after a last failed event
end

function event_signal(e)
	if e.self:GetSpawnPointID() == 345999 then	--1st Instance
		if e.signal == 1  then 
			deactivate(e.self);
			depop_guards(100,1200,-3050,-2000);
			reset_steeds(e.signal)
			loaded = false;
		elseif e.signal == 50 then
			activate(e.self);
			eq.signal(204082,1); --activate knight guards
		elseif e.signal == 100 then
			
			if not check_steeds(100,1200,-3050,-2000) and not loaded then	--mujaki boundaries Instance #1
				loaded = true;
				eq.unload_encounter("Mujaki_1");	--unload incase already loaded
				eq.load_encounter("Mujaki_1");
			end
		end
	end
end

function check_steeds(min_x,max_x,min_y,max_y)
	local npc_list = eq.get_entity_list():GetNPCList();
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if  npc:GetNPCTypeID() == 204038 and npc:GetX() > min_x and npc:GetX() < max_x and npc:GetY() > min_y and npc:GetY() < max_y then	--checks for Mujaki based on encounter boundaries defined
				return true;	--steed still up
			end
		end
	end
end


function depop_guards(min_x,max_x,min_y,max_y)
	local npc_list = eq.get_entity_list():GetNPCList();
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if (npc:GetNPCTypeID() == 204081 or npc:GetNPCTypeID() == 204082) and npc:GetX() > min_x and npc:GetX() < max_x and npc:GetY() > min_y and npc:GetY() < max_y then		--checks for guards based on area boundary
				npc:Depop();
			end
		end
	end
end

function reset_steeds(id)
	local steed_spawnpoints = { [1] = {345939, 345940, 345941}};	--instance 1 steed spawnpoints
	for _,steeds in pairs(steed_spawnpoints[id]) do
		local steed = eq.get_entity_list():GetSpawnByID(steeds);
		if not steed:NPCPointerValid() then
			steed:Repop(5);
		end
	end
end


function deactivate(mob)
	eq.stop_all_timers();
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);	--will not aggro
	mob:SetSpecialAbility(35, 1);	--no harm from players
	mob:WipeHateList();
	mob:GotoBind();
end

function activate(mob)
	mob:SetBodyType(3, true);		--undead
	mob:SetSpecialAbility(24, 0);	--will not aggro
	mob:SetSpecialAbility(35, 0);	--no harm from players
end
