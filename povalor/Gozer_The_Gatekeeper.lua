--Gozer_The_Gatekeeper
--Full zone instance version, Trust edition
--povalor

--Named/unique mob controls to despawn within instance
local disable_instance = {}
local static_named = {208157,208165,208160};	--disable these spawnpoints since they don't share other trash NPCS (also are included above in disabled instance)


local player_list = true;
local player_list_count = nil;
local entity_list = nil;
local client_e = nil;
local group = nil;
local raid = nil;

function event_say(e)
    local instance_id = eq.get_zone_instance_id();
    if(instance_id ~= 0) then
        e.self:Say("Hail Traveler!  I am pleased to see you made it through the rift unharmed.");
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
            e.other:MovePCInstance(208, tonumber(instanceId), 190,-1670,70,0);
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
    if(instance_id ~= 0) then
        local mysql = require("luasql_ext");
        for id,name in mysql.rows(con,"SELECT id from npc_types WHERE id >= 208000 and id < 209000 and disable_instance = 1") do
            disable_instance[id] = tonumber(id);
        end
        eq.set_timer("scan", 5 * 1000);
    end
end

function event_timer(e)
    if e.timer == "scan" then
        local npc_list = eq.get_entity_list():GetNPCList();
        if npc_list ~= nil then
            for npc in npc_list.entries do
                for k,npc_id in pairs(disable_instance) do
                    if npc:CastToMob():GetNPCTypeID() == npc_id then
                        local spawn = eq.get_entity_list():GetSpawnByID(npc:GetSpawnPointID());
                        spawn:ForceDespawn();
                        if DisableCheck(npc_id) then
                            spawn:Disable();
                        else
                            spawn:Repop(1);
                        end
                    end
                end
            end
        end
    end
end

function DisableCheck(npc)
    for k,v in pairs(static_named) do
        if npc == v then
            return true;
        end
    end
    return false;
end