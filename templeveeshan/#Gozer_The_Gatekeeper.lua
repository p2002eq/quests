local player_list = nil;
local player_list_count = nil;
local entity_list = nil;
local client_e = nil;
local group = nil;
local raid = nil;

function event_say(e)
    local instanceId = nil;  -- from the global
    if(e.message:findi('hail')) then
        e.self:Say("Greetings Traveler, recently there has been talk of rifts in space and time. These rifts have been allowing well established groups of adventurers to explore identical instances of norrath.");
        e.self:Say("Are you [" .. eq.say_link("brave") .. "] enough to travel through these portals?");
    elseif(e.message:findi('brave')) then
        local qglobals = eq.get_qglobals(e.other);
        local zoneGlobal = "TOV-" .. tostring(e.other:GuildID());
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
            eq.MovePCInstance(124, tonumber(instanceId), -500, -2100, -37, 255);
            --PortChars(e.other:GetX(), e.other:GetY(), e.other:GetZ(), 50, -500, -2100, -37, 255, 124,tonumber(instanceId), e.other:GuildID());
        else
            e.other:Message(13,"There is no instance available in this zone for your guild,");
        end
    end
end


function PortChars(cur_x, cur_y, cur_z, distance, dest_x, dest_y, dest_z, dest_h, dest_zone, dest_instance, guildId)
    player_list = nil;
    player_list_count = nil;
    if (raid.valid == true) then
        player_list = raid;
        player_list_count = raid:RaidCount();
    elseif (group.valid == true) then
        player_list = group;
        player_list_count = group:GroupCount();
    end
    if (player_list ~= nil) then
        for i = 0, player_list_count - 1, 1 do --Uses a 0-n group memembers
            local client_v = player_list:GetMember(i):CastToClient();
            if (client_v.valid and client_v:GuildID() == guildId) then --valid client
                if (client_v:CalculateDistance(cur_x, cur_y, cur_z) <= distance) then
                    -- check distance and port up
                    client_v:MovePCInstance(dest_zone, dest_instance, dest_x, dest_y, dest_z, dest_h);
                end
            end
        end
    else --not grouped
        client_e.other:MovePCInstance(dest_zone, dest_instance, dest_x, dest_y, dest_z, dest_h);
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