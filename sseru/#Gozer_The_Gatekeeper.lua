local show_debug = false;


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
      e.self:Say("Your instance id is " .. instance_id);
      e.self:Say("This is a proximity instance");
      return;
    end

    local instanceId = nil;  -- from the global
    if(e.message:findi('hail')) then
        e.self:Say("Greetings Traveler, recently there has been talk of rifts in space and time. These rifts have been allowing well established groups of adventurers to explore identical instances of norrath.");
        e.self:Say("Are you [" .. eq.say_link("brave") .. "] enough to travel through these portals?");
    elseif(e.message:findi('brave')) then
        local qglobals = eq.get_qglobals(e.other);
        local zoneGlobal = "SSERU-" .. tostring(e.other:GuildID());
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
            e.other:MovePCInstance(159, tonumber(instanceId), -205, -301, 57, 228);
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
        for i = 0, player_list_count - 1, 1 do --Uses a 0-n group memembers
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
        for i = 0, player_list_count - 1, 1 do --Uses a 0-n group memembers
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
    eq.zone_emote(4, "Spawned.....");
  end

    if (instance_id ~= 0) then
      local max_x = -23;
      local min_x = -442;
      local max_y = -225;
      local min_x = -640;
      run_proximity_depop_timer({max_x=-23, min_x=-442, max_y=-222, min_y=-640});
    end

end

function run_proximity_depop_timer(box)
  proximity_rules = box;
  scan_for_out_of_prox()
  eq.set_timer("proxminity_clear", 10000)
end

function scan_for_out_of_prox()
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

      if (
            (x < proximity_rules['max_x'] and x > proximity_rules['min_x'])
            and
            (y < proximity_rules['max_y'] and y > proximity_rules['min_y'])
          ) then
        depopMe = false;
      end

      if (npc:GetCleanName() == 'zone_controller' or npc:GetCleanName() == 'zone controller') then
        depopMe = false;
      end

      if (show_debug and depopMe) then
        eq.zone_emote(4, npc:GetCleanName() .. " NPCID: " .. npc:GetNPCTypeID() .. " is out of bounds depoping... x:" .. x .. " y: " .. y);
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

      if (
            (x < proximity_rules['max_x'] and x > proximity_rules['min_x'])
            and
            (y < proximity_rules['max_y'] and y > proximity_rules['min_y'])
          ) then
        moveMe = false;
      end

      if (moveMe) then
        eq.zone_emote(4, player:GetCleanName() .. " is out of bounds moving... x:" .. x .. " y: " .. y);
        local instanceId = eq.get_zone_instance_id();
        player:MovePCInstance(159, tonumber(instanceId), -205, -301, 57, 228);
      end
    end
  end

end

function event_timer(e)
  if(e.timer == 'proxminity_clear') then
      if (show_debug) then
        eq.zone_emote(4, "Starting proximity scan.....");
      end
    scan_for_out_of_prox()
  end
end