local encounter_locs = {[1] = {164,-2113,169,128}, [2] = {-882,-3112,169,128}, [3] = {-1936,-2109,169,128} };
local encounter_id;
local group_counter = {0,0,0};
local raid_id_by_encounter = {};
local player_list_by_encounter = { [1] = {}, [2] = {}, [3] = {} };
local player_counter = {0,0,0};
local encounter_monitor = {false, false, false};

function event_spawn(e)
	eq.set_timer("monitor", 1 * 1000); --30 seconds typical interval
end

function event_say(e)
	local qglobals = eq.get_qglobals(e.self, e.other);
	local raid = e.other:GetRaid();
	local zone_id = eq.get_zone_id();

	
	if e.message:findi("hail") then	
		e.self:Emote("looks at you with wide, wild eyes.  'Who... What...   Who are you?  If you are a sending from my [" .. eq.say_link("brother") .. "], you will not take me so easily!'");
	elseif e.message:findi("brother")  then
		e.self:Say("Mujaki!  Haha! He... He captured me and...  Imprisoned me here as punishment for some supposed transgressions against him.  Mujaki always was jealous of my own prowess and resentful of our fathers favor toward me.  He has only further proven his weakness through trapping me with power granted to him by Terris-Thule.  Hmm, [" .. eq.say_link("perhaps what?",false,"perhaps") .. "]...")
	elseif e.message:findi("perhaps what?") then
		e.self:Say("Perhaps you could find some way to overwhelm Mujaki?  I might be able to work an enchantment to transport you closer to my brother.  I only feel I have the power to send twenty four of you, when you have formed rank please have the leaders of your groups let me know when you are [" .. eq.say_link("ready") .. "].")
	elseif e.message:findi("ready") and raid:IsGroupLeader(e.other:GetName()) then 
		eq.set_timer("monitor", 5 * 1000); 	--restart incase somehow timer got stopped
		raid_id = raid:GetID();
		raid_group = raid:GetGroup(e.other:GetName());
	
		--Mujaki Instance availability checking routine
		--Check first for rejoining players
		if raid_id_by_encounter[1] == raid_id and player_check(1, e.other:CharacterID()) then
			encounter_id = 1;
			
		--[[elseif raid_id_by_encounter[2] == raid_id and player_check(2, e.other:CharacterID()) then	--additional instances 2 & 3 not setup yet.  can be integrated if needed later--
			encounter_id = 2;
		elseif raid_id_by_encounter[3] == raid_id and player_check(3, e.other:CharacterID()) then
			encounter_id = 3;]]
			
		--Check next for encounter_ids already established by another raid but not yet started and below 3 group max
		elseif raid_id_by_encounter[1] == raid_id and group_counter[1] < 4 then
			encounter_id = 1;
			
		--[[elseif raid_id_by_encounter[2] == raid_id and group_counter[2] < 4 then		--additional instances not setup yet.  can be integrated if needed later--
			encounter_id = 2;
		elseif raid_id_by_encounter[3] == raid_id and group_counter[3] < 4 then
			encounter_id = 3;]]
			
		--Next will assign new Mujaki Instance if available since not a rejoining character and 
		elseif group_counter[1] < 4 and raid_id_by_encounter[1] == nil then
			raid_id_by_encounter[1] = raid_id;	--assign new raid id
			encounter_id = 1;	--Mujaki Instance 1 open
			
		--[[elseif group_counter[2] < 4 and raid_id_by_encounter[2] == nil then		--additional instances not setup yet.  can be integrated if needed later--
			raid_id_by_encounter[2] = raid_id;	--assign new raid id
			encounter_id = 2;	-- encounter_id 2 available
		elseif group_counter[3] < 4 and raid_id_by_encounter[3] == nil then
			raid_id_by_encounter[3] = raid_id;	--assign new raid id
			encounter_id = 3;	-- encounter_id 3 available]]
		else	
			encounter_id = -1;	--no Mujaki Instance_ids available
		end
		
		if encounter_id > 0 and (group_counter[encounter_id] < 4 or (raid_id_by_encounter[encounter_id] == raid:GetID() and player_check(encounter_id, e.other:CharacterID())))  then
				
			--handle group counter increments	
			if not player_check(encounter_id, e.other:CharacterID()) then	--not incrementing counter if group is rejoining (player check done separately to still monitor  limit)
				group_counter[encounter_id] = group_counter[encounter_id] + 1;	--group counter
			end			

			--Raid Member handling
			local client_list = eq.get_entity_list():GetClientList();
			if client_list ~= nil then
				for client in client_list.entries do
					if client:IsRaidGrouped() and client:GetRaid():GetID() == raid_id and client:GetRaid():GetGroup(client:GetName()) == raid_group then
						client_qglobal = eq.get_qglobals(client);
						if client:CastToMob():CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 100 then
							if player_check(encounter_id, client:CharacterID()) then 	--rejoining character to raid
								client:MovePC(zone_id,unpack(encounter_locs[encounter_id]));
								eq.zone_emote(13,client:GetName() .. " is rejoining Mujaki Instance " .. encounter_id .. " (Raid ID #: " .. client:GetRaid():GetID() .. ") Char ID: [" .. client:CharacterID() .. "]");
								eq.zone_emote(14,"Total player count for Mujaki Instance " .. encounter_id .. " is [" .. player_counter[encounter_id] .. "]");
							elseif player_counter[encounter_id] < 24 then				--new raid addition
								client:MovePC(zone_id,unpack(encounter_locs[encounter_id]));
								player_counter[encounter_id] = player_counter[encounter_id] + 1;
								player_list_by_encounter[encounter_id][player_counter[encounter_id]] = client:CharacterID();	--store character ID in table
								eq.zone_emote(4,client:GetName() .. " is a new addition for Mujaki Encounter -- Raid ID: [ " .. client:GetRaid():GetID() .. "] Char ID: [" .. client:CharacterID() .. "]");
								eq.zone_emote(14,"Total player count for Mujaki Encounter is [" .. player_counter[encounter_id] .. "/24]");
							end
						end
					end
				end
			end		
		elseif encounter_id == -1 then
			e.self:Say("I have already sent twenty-four adventurers through the portal. I hope they will be sufficent to vanquish Mujaki.");
		end
	elseif e.message:findi("ready")	then
		e.self:Say("Do not underestimate my brother's power.  Please let me know once your raiding party is established and then have your group leaders tell me they are [" .. eq.say_link("ready") .. ".]")
	end
end

function player_check(mz_id, char_id)
	if player_counter[mz_id] ~= nil then
		num = player_counter[mz_id];
		for n = 1,num do
			if player_list_by_encounter[mz_id][n] == char_id then
				return true;
			end
		end
	end
	return false;
end

function client_check(player)
	for n = 1,3 do
		encounter_monitor[n] = false;	--reset each iteration
		for x = 1,player_counter[n] do
			if player:CharacterID() == player_list_by_encounter[n][x] then
				if player:GetY() < -2000 then
					encounter_monitor[n] = true;
				end
				return true;
			end
		end
	end
	return false;
end

function event_timer(e)
	if e.timer == "monitor" then
		eq.stop_timer(e.timer);
		eq.set_timer("monitor", 30 * 1000);	--reset to 30 sec interval checks
		client_list = eq.get_entity_list():GetClientList();
		if client_list ~= nil then
			for client in client_list.entries do
				if not client_check(client) and client:GetY() < -2000 and not client:GetGM() then
					client:Message(7,"You have been banished!");
					eq.zone_emote(13,client:GetName() .. " is not on assigned player list for this area.  Moving player to safe spot");
					client:MovePC(204, 1668, 282, 212, 0);
				end
			end
		end
		
		--additional check to see if clients still in encounter area
		for n = 1,3 do
			if group_counter[n] > 0 and not encounter_monitor[n] then
				EncounterReset(n);
				eq.zone_emote(13, "No players remaining in encounter area - Resetting Mujaki Encounter");
			end
		end
		
	end
end

function event_signal(e)	--debugging
	if e.signal == 1 then	--reset event signal from Mujaki Instance 1
		EncounterReset(e.signal);
	elseif e.signal == 2 then	--reset event signal from Mujaki Instance 2
		EncounterReset(e.signal);
	elseif e.signal == 3 then	--reset event signal from Mujaki Instance 3
		EncounterReset(e.signal);
	elseif e.signal == 99 then
		for n = 1,3 do 
			eq.zone_emote(13,"Mujaki Instance " .. n .. " group # is: " .. group_counter[n] .. " -- Raid ID: " .. tostring(raid_id_by_encounter[n]) .. " -- Player Count: " .. tostring(player_counter[n]));	--debug
		end
	elseif e.signal == 98 then
		if player_counter[1] ~= nil then
			num = player_counter[1];
			for n = 1,num do
				e.self:Shout(tostring(player_list_by_encounter[1][n]));
			end
		end
	end
end

function EncounterReset(id)
	group_counter[id] = 0;
	raid_id_by_encounter[id] = nil;
	player_list_by_encounter[id] = {};
	player_counter[id] = 0;
	encounter_monitor[id] = false;
	eq.signal(204039,id); --signal Mujaki to Reset
	eq.unload_encounter("Mujaki_" .. id);
	eq.zone_emote(14,"Mujaki Instance " .. id .. " has been reset!");	--debug
end
	

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
