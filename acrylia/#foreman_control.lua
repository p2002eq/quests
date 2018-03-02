--Foreman_Gworknop Event
--Inner Acrylia 1.0


local guard = 154403;	--a_reanimated_deathguard
local foreman;

local spawnpoints = {324893, 324894, 324896, 324897, 324898, 324899, 324900, 324901, 324902, 324903};	--10 spawns around Foreman	

function event_signal(e)
	if e.signal == 1 then	--signal from elite guards death
		if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154170) then 	-- checks to see if all deathguards are dead
			StartEvent();
			eq.set_timer("event_reset", 30 * 60 * 1000); --30 min event timer before full reset
		end
	elseif e.signal == 2 then
		eq.stop_timer("event_reset");
		eq.set_timer("event_reset", 5 * 60 * 1000); --5 min to reset event after Foreman Death
	end
end

function event_timer(e)
	if e.timer == "guard_depop" then
		eq.depop_all(guard);	--depop undead deathguards
	elseif e.timer == "event_reset" then
		eq.stop_all_timers();
		eq.depop_all(guard);	--depop all undead deathguards
		eq.depop(154389);	--depop targetable Foreman if up
		Repop();	--repop corpses around Foreman
		eq.get_entity_list():GetSpawnByID(324892):Repop(5); --repop untargetable Foreman
	end
end

function StartEvent()
	if eq.get_entity_list():IsMobSpawnedByNpcTypeID(154118) then	--Foreman_Gworknop (untargetable version)
		eq.depop_with_timer(154118);
		foreman = eq.spawn2(154389,0,0,344,-276,10,392.0);	--spawn targetable version #Foreman_Gworknop
		foreman:Shout("Rise minions! Our master's work must not be interrupted!");
	end	
	
	SpawnGuards();	--spawn undead skeletons
	eq.set_timer("guard_depop", 20 * 60 * 1000);	--guards depop in 20 min regardless
end

function Repop()
	for _,spawns in pairs(spawnpoints) do
		local corpses = eq.get_entity_list():GetSpawnByID(spawns);
		corpses:Enable();
		corpses:Reset();
		corpses:Repop(5);
	end
end

function SpawnGuards(undead)	--if undead = true then spawns guards.  if false it will not
	for _,spawns in pairs(spawnpoints) do
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == spawns then
					eq.spawn2(guard,0,0,npc:GetX(), npc:GetY(), npc:GetZ(), npc:GetHeading());
					npc:Depop(true);
				end
			end
		end
	end
end
