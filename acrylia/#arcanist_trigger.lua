--#arcanist_trigger (NPC 154122)
-- Khati Sha Event
-- Ward of Spirit 

local west_grimling_locs = { [1] = {615,-375,-23,64}, [2] = {655,-375,-23,187}, [3] = {635,-355,-23,128}, [4] = {635,-395,-23,260} };
local east_grimling_locs = { [1] = {520,-375,-23,64}, [2] = {560,-375,-23,187}, [3] = {540,-355,-23,128}, [4] = {540,-395,-23,260} };
local arcanist_locs = { [1] = {540,-375,-24,64}, [2] = {635,-375,-24,190} };
local deathguard_locs = { [1] = {670,-388,-23,192}, [2] = {660,-388,-23,192}, [3] = {670,-363,-23,192}, [4] = {660,-363,-23,192} };

local arcanists = {154151, 154152}  -- (1) True Arcanist (2) False Arcanist
local grimlings = {154148, 154149} -- (1) True location (2) False Location (both NPCS are grimling_spiritwarders)
local khati = false;

local deathguard_counter;

function event_spawn(e)
	Setup();
	eq.depop(154052);
	eq.depop(154053);
	eq.set_timer("fail", 60 * 60 * 1000);  --60 min
	local scenario = math.random(1,2);
	if scenario == 1 then 
		eq.unique_spawn(arcanists[1],0,0,unpack(arcanist_locs[1]));	-- Spiritual Arcanist V1 (True Arcanist)
		eq.unique_spawn(arcanists[2],0,0,unpack(arcanist_locs[2]));	-- Spiritual Arcanist V2 (False Arcanist)
		
		SpawnMobs(grimlings[1],east_grimling_locs);
		SpawnMobs(grimlings[2],west_grimling_locs);
	else
		eq.unique_spawn(arcanists[2],0,0,unpack(arcanist_locs[1]));	-- Spiritual Arcanist V1 (False Arcanist)
		eq.unique_spawn(arcanists[1],0,0,unpack(arcanist_locs[2]));	-- Spiritual Arcanist V2 (True Arcanist)

		SpawnMobs(grimlings[2],east_grimling_locs);
		SpawnMobs(grimlings[1],west_grimling_locs);
	end

end

function Setup()
	local instance_id = eq.get_zone_instance_id();
	eq.delete_global(instance_id.. "_IAC_Seal_2");	--clear qglobal if already up for some reason
	eq.depop_all(154159);
	for n = 1,2 do 
		eq.depop(arcanists[n]);	--depop arcanists if up for some reason
		eq.depop_all(grimlings[n]); --depop spiritwarders if up for some reason
	end
	deathguard_counter = 0;
end

function event_timer(e)
	if e.timer == "fail" then
		eq.stop_timer(e.timer);
		for n = 1,2 do 
			eq.depop(arcanists[n]);	--depop arcanists 
			eq.depop_all(grimlings[n]); --depop spiritwarders 
		end
		eq.depop(154153)	--depop raid arcanist
		eq.depop();
	end
end
	
function event_signal(e)
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self); 

	if e.signal == 1 then	--signal to spawn deathguards
		SpawnMobs(154058,deathguard_locs);  -- spawn deathguards
	elseif e.signal == 20 then 
		deathguard_counter = deathguard_counter + 1;
		if deathguard_counter >= 4 and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154153) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(154058) then 	--success - opens last seal and progresses event to final stage (requires deathguards and false grimling arcanist dead (if triggered)
			eq.signal(154151,1)	 --signals True Arcanist (if correct scenario chosen otherwise he will not be up)
			if eq.get_entity_list():IsMobSpawnedByNpcTypeID(154138) then
				eq.set_global(instance_id.. "_IAC_Seal_2","1",3,"H2");	--sets flag on 4 panel door to advance
				eq.zone_emote(1,"The caverns rumble and shake violently as the third protective seal is broken. Khati Sha shouts, 'Who dares break the seals and defile the inner sanctum?! Come forth so that I may crush you!'");
				eq.spawn2(154059,0,0,684,-379,-23,192);
				eq.spawn2(154059,0,0,684,-369,-23,192);
				eq.signal(154138,30);  --signal Khati`Sha to Activate (become targetable)
			else
				eq.zone_emote(13,"Khati Sha does not want an audience with you.");
				eq.depop();
			end
		end
	end
end

function SpawnMobs(npc, locs)  --used to spawn both spiritwarders and deathguardss since both are in packs of 4
	for n = 1,4 do 
		eq.spawn2(npc,0,0,unpack(locs[n]));	
	end
end

