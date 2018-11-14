--player.lua for Plane of Time A
--original PEQ script modified by Daeron for Project 2002

function event_enter_zone(e)	
	-- load the current qglobals
	local qglobals = eq.get_qglobals(e.self);
	if ( qglobals["time_emote"] == nil and e.self:Admin() < 10 ) then
		eq.world_emote(15, "The earth rumbles, sky thunders, volcanoes erupt, and tidal waves crash as the Gods prepare their armies for battle. The first of the mortals have obtained the power to cross into the Plane of Time!");
		e.self:CameraEffect(3000,6,e.self,true);	--flavor (3 sec earthquake)
		eq.set_global("time_emote","TimeEntered",7,"F");
	end
	local discs = require('disciplines');
	discs:update_discs(e, e.self:GetLevel());
end

function event_level_up(e)
	local discs = require('disciplines');
	discs:train_discs(e, e.self:GetLevel());
end

function event_click_door(e)
	local door_id = e.door:GetDoorID();
	if (door_id >= 8 and door_id <=12) then
		local qglobals = eq.get_qglobals(e.self);
        local zoneGlobal = "POTIMEB-" .. tostring(e.self:GuildID());
		e.self:Message(10, "The portal, dim at first, begins to glow brighter.");
		
        instance_id = qglobals[zoneGlobal];
        if (instance_id ~= nil) then		
			-- check for lockout qglobal.
			if (e.self:Admin() <= 80 and ((qglobals[instance_id.."_potimeb_status"] == "Failed") or 
				 (qglobals[instance_id.."_potimeb_status"] == "QuarmDead"))) then 
				e.self:Message(13, "A strange magical presence prevents you from entering.  It's too dangerous to enter at the moment. ");
				return;
			end
						
			--assign instance
            entity_list = eq.get_entity_list(); --get current entity list of zone
            client_e = e;
            raid = e.self:GetRaid();
            group = e.self:GetGroup();
            if (raid ~= nil and check_raid_guild(raid,e.self:GuildID())) then
                eq.assign_raid_to_instance(tonumber(instance_id));
            elseif (group ~= nil and check_group_guild(group,e.self:GuildID())) then
                eq.assign_group_to_instance(tonumber(instance_id));
            else
                eq.assign_to_instance(tonumber(instance_id));
            end
					
			e.self:Message(10, "The portal flashes briefly, then glows steadily.");
			
			--handles porting player to specified area if raid is currently in Phase 3 or further
			if qglobals[instance_id .. "_potimeb_status"] ~= nil then
				--e.self:Message(14,string.format("[Found raid in progress! Sending %s to %s]",e.self:GetName(),qglobals[instance_id .. "_potimeb_status"]));	--debug
				if qglobals[instance_id .. "_potimeb_status"] == "Phase3" then
					e.self:MovePCInstance(223, tonumber(instance_id), 585,1110,496,127);
					return;
				elseif qglobals[instance_id .. "_potimeb_status"] == "Phase4" then
					e.self:MovePCInstance(223,tonumber(instance_id),-395,0,350,127);
					return;
				elseif qglobals[instance_id .. "_potimeb_status"] == "Phase5" then	
					e.self:MovePCInstance(223,tonumber(instance_id),-410,0,5,127);
					return;
				elseif qglobals[instance_id .. "_potimeb_status"] == "Phase6" then	
					e.self:MovePCInstance(223,tonumber(instance_id),330,0,5,127);
					return;
				end
			end 
			
			-- create a qglobal for status tracking
			eq.set_global(instance_id.."_potimeb_status","Phase1",7,"H13");
			
			-- send them into their instance
			if (door_id == 8) then
				-- GetDoorID =  8 : Air Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -36, 1352, 496, 124);
			elseif (door_id == 9) then
				-- GetDoorID =  9 : Water Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -51, 857, 496, 124);
			elseif (door_id == 10) then
				-- GetDoorID = 10 : Earth Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -35, 1636, 496, 124);
			elseif (door_id == 11) then
				-- GetDoorID = 11 : Fire Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -55, 569, 496, 124);
			elseif (door_id == 12) then
				-- GetDoorID = 12 : Undead Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -27, 1103, 496, 124);
			end
		else
            e.self:Message(13,"There is no instance available in this zone for your guild.");
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
