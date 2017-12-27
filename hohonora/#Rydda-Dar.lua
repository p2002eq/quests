--#Rydda`Dar (211105)
--Trial #1
--hohonora

local room_mobs = {361050, 361051, 361052, 360860};  --spawnpoints in room


function event_spawn(e)
	eq.set_timer("depop",2*60*60*1000);	--2hr timer
	
	--Room mobs should depop once Rydda`Dar spawns if not previously killed
	for _,spawns in pairs(room_mobs) do
		local npc_list = eq.get_entity_list():GetNPCList();

		if(npc_list ~= nil) then
			for npc in npc_list.entries do
				if npc:GetSpawnPointID() == spawns then
					npc:Depop(true);	--depops mob with respawn timer enabled
				end
			end
		end
	end
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.spawn2(211053,0,0,-1725,2040,-118,0);	--#Trydan_Faye (211053)
	eq.update_spawn_timer(360859,259200000 + math.random(-43200000,43200000)); --Set Trydan respawn timer to 3 days +/- 12 hrs on win
end