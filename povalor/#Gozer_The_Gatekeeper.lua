--Gozer_The_Gatekeeper
--Raid Instance Gozer - Aerin`Dar's Lair
--povalor

local show_debug = false;
local disabled_npcs = {208061};	--npcs in the allowable grid that should not be killable/usable 


local player_list = true;
local player_list_count = nil;
local entity_list = nil;
local client_e = nil;
local group = nil;
local raid = nil;

local proximity_rules = nil;

function event_say(e)
    local instance_id = eq.get_zone_instance_id();
    if(instance_id ~= 0) then
		e.self:Say("Hail Traveler! This instance will allow you to continue your journey further into the planes. Be wary of straying too far as the rifts can be dangerous and the results unpredictable.");
		return;
    end

    local instanceId = nil;  -- from the global
    if(e.message:findi('hail')) then
        e.self:Say("Greetings Traveler!  I have identified a stable rift that will allow you to explore an identical instance of this location.");
        e.self:Say("Are you [" .. eq.say_link("brave") .. "] enough to travel through the portal?");
    elseif(e.message:findi('brave')) then
        local qglobals = eq.get_qglobals(e.other);
        local zoneGlobal = "POVALOR-" .. tostring(e.other:GuildID());
        instanceId = qglobals[zoneGlobal];
        if (instanceId ~= nil) then
            entity_list = eq.get_entity_list(); --get current entity list of zone
            client_e = e;
            raid = e.other:GetRaid();
            group = e.other:GetGroup();
            if (raid ~= nil and check_raid_guild(raid,e.other:GuildID())) then
                eq.assign_raid_to_instance(tonumber(instanceId));
            elseif (group ~= nil and check_group_guild(group,e.other:GuildID())) then
                eq.assign_group_to_instance(tonumber(instanceId));
            else
                eq.assign_to_instance(tonumber(instanceId));
            end
            e.other:MovePCInstance(208, tonumber(instanceId), 360,1960,170,0); 
        else
            e.other:Message(13,"There is no instance available in this zone for your guild,");
        end
    end
end

function check_raid_guild(cur_raid, guildId)
    local same_guild = 0;
    player_list = nil;
    player_list_count = nil;
    if (cur_raid.valid == true) then
        player_list = cur_raid;
        player_list_count = cur_raid:RaidCount();
    end
    if (player_list ~= nil) then
        for i = 0, player_list_count - 1, 1 do --Uses a 0-n group members
            local client_v = player_list:GetMember(i):CastToClient();
            if (client_v.valid and client_v:GuildID() == guildId) then --valid client
                same_guild = same_guild + 1;
            end
        end
    end
    if (player_list ~= nil and same_guild == player_list_count) then
        return true;
    else
        return false;
    end
end

function check_group_guild(cur_group, guildId)
    local same_guild = 0;
    player_list = nil;
    player_list_count = nil;
    if (cur_group.valid == true) then
        player_list = cur_group;
        player_list_count = cur_group:GroupCount();
    end
    if (player_list ~= nil) then
        for i = 0, player_list_count - 1, 1 do --Uses a 0-n group members
            local client_v = player_list:GetMember(i):CastToClient();
            if (client_v.valid and client_v:GuildID() == guildId) then --valid client
                same_guild = same_guild + 1;
            end
        end
    end
    if (player_list ~= nil and same_guild == player_list_count) then
        return true;
    else
        return false;
    end
end

function event_spawn(e)
  local instance_id = eq.get_zone_instance_id();
  if (show_debug) then
    eq.GM_Message(4, "Spawned.....");
  end

    if (instance_id ~= 0) then
		local table_locs = {	[1] = {max_x = 275,  min_x = 140,  max_y = -1300, min_y = -1700},
								[2] = {max_x = 1000, min_x = -550, max_y = 5300,  min_y = 1800} 
							};
      run_proximity_depop_timer(table_locs);
    end

end

function run_proximity_depop_timer(box)
  proximity_rules = box;
  scan_for_out_of_prox()
  eq.set_timer("proximity_clear", 10000)
end

function scan_for_out_of_prox()
	--disable instance NPCS that are set within instance limits
	for k,v in pairs(disabled_npcs) do
		eq.depop_all(v);
	end

	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- get the list of npcs currently spawned in the zone
	local npc_list = entity_list:GetNPCList();
	-- do not do anything if there are no NPC's spawned. should be an impossible check because this is in an NPC script
	local player_list = entity_list:GetClientList();

	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			local x = npc:GetX();
			local y = npc:GetY();
			local depopMe = true;
			
			for k,loc in pairs(proximity_rules) do
				if (
				(x <= loc['max_x'] and x >= loc['min_x'])
				and
				(y <= loc['max_y'] and y >= loc['min_y'])
				) then
				depopMe = false;
				end
			end

			if (npc:GetCleanName() == 'zone_controller' or npc:GetCleanName() == 'zone controller') then
				depopMe = false;
			end
			
			if (show_debug and depopMe) then
				eq.GM_Message(4, npc:GetCleanName() .. " NPCID: " .. npc:GetNPCTypeID() .. " is out of bounds depoping... x:" .. x .. " y: " .. y);
			end

			if(depopMe) then
			npc:Depop();
			end
		end
	end
	-- player logic
	if (player_list ~= nil) then
		for player in player_list.entries do
			local x = player:GetX();
			local y = player:GetY();
			local moveMe = true;

			for k,loc in pairs(proximity_rules) do
				if (
				(x <= loc['max_x'] and x >= loc['min_x'])
				and
				(y <= loc['max_y'] and y >= loc['min_y'])
				) then
				moveMe = false;
				end
			end
			
			if player:GetGM() then
				moveMe = false;
			end

			if (moveMe) then
				eq.GM_Message(4, player:GetCleanName() .. " is out of bounds moving... x:" .. x .. " y: " .. y);
				local instanceId = eq.get_zone_instance_id();
				player:Message(15,"You were moved to safety by Gozer!  Gozer tells you,'Stay on course, adventurer.  I nearly lost you to that rift!'");
				player:MovePCInstance(208, tonumber(instanceId), 190,-1670,70,0); 
			end
		end
	end

end

function event_timer(e)
  if(e.timer == 'proximity_clear') then
      if (show_debug) then
        eq.GM_Message(4, "Starting proximity scan.....");
      end
    scan_for_out_of_prox()
  end
end
