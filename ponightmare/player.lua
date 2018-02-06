--player.lua for
--Plane of Nightmare
function event_enter_zone(e)
    local instance_id = eq.get_zone_instance_id();
    local instance_version = eq.get_zone_instance_version();
    local discs = require('disciplines');
    discs:update_discs(e, e.self:GetLevel());

    --e.self:Message(1,string.format("[DEBUG], InstanceID = %i, Instance Version = %i",instance_id,instance_version));

    if(instance_id ~= 0) then
        e.self:Message(15,"You have entered a Instanced Version of the zone.");
    end
end

function event_level_up(e)
    local discs = require('disciplines');
    discs:train_discs(e, e.self:GetLevel());
end

--set zoneflag for entrance to PoNB
function event_click_door(e)
	local door = e.door:GetDoorID();
	local instance_id = eq.get_zone_instance_id();
	local qglobals = eq.get_qglobals(e.self);
	eq.zone_emote(14,"Door ID is: " .. door);   --debug to easily check door IDs

	if door == 59 then
		if qglobals.pop_pon_construct ~= nil and qglobals.pop_pon_hedge_jezith ~= nil  then
			if not e.self:HasZoneFlag(221) then
				e.self:SetZoneFlag(221);
			end
		else
			e.self:Message(13,"You lack the will to pass through this portal safely.");
		end
	end
end

---DEBUG----
--zone flagging
function event_say(e)
	local qglobals = eq.get_qglobals(e.self);
	
	--Hedge Maze Testing
	if e.self:GetGM() and e.message:findi("maze status") then
		if qglobals["pop_pon_maze_event_1"] == nil then
			e.self:Message(14, "Maze 1 [OPEN]");	--maze_id 1 available
		else
			e.self:Message(13, "Maze 1 [LOCKED]");
		end
		if qglobals["pop_pon_maze_event_2"] == nil then
			e.self:Message(14, "Maze 2 [OPEN]");	--maze_id 1 available
		else
			e.self:Message(13, "Maze 2 [LOCKED]");
		end
		if qglobals["pop_pon_maze_event_3"] == nil then
			e.self:Message(14, "Maze 3 [OPEN]");	--maze_id 1 available
		else
			e.self:Message(13, "Maze 3 [LOCKED]");
		end
	elseif e.message:findi("delete flag") then
			eq.delete_global("pop_pon_hedge_jezith");
			eq.delete_global("pop_pon_construct");
			e.self:Message(14, "Maze pre-flag and construct flag deleted!")
	elseif e.message:findi("maze preflag") then
		eq.set_global("pop_pon_hedge_jezith", "1", 5, "F");
		e.self:Message(15, "Maze pre-flag added!")
	elseif e.message:findi("maze construct") then
		eq.set_global("pop_pon_construct", "1", 5, "F");
		e.self:Message(15, "Maze pre-flag added!")
	elseif e.self:GetGM() and e.message:findi("maze signal") then
		eq.signal (204070, 99); --check count 
	elseif e.self:GetGM() and e.message:findi("list") then
		eq.signal (204070, 98); --check player list
	elseif e.self:GetGM() and e.message:findi("maze reset all") then
		eq.delete_global("pop_pon_maze_event_1");
		eq.delete_global("pop_pon_maze_event_2");
		eq.delete_global("pop_pon_maze_event_3");
		e.self:Message(4,"Maze qglobals reset");
	elseif e.self:GetGM() and e.message:findi("maze reset 1") then
		eq.signal (204070, 1);
	elseif e.self:GetGM() and e.message:findi("maze reset 2") then
		eq.signal (204070, 2);
	elseif e.self:GetGM() and e.message:findi("maze reset 3") then
		eq.signal (204070, 3);
	-----Mujaki_The_Devourer Testing
	elseif e.self:GetGM() and e.message:findi("mujaki start") then
		eq.load_encounter("Mujaki_1");
	elseif e.self:GetGM() and e.message:findi("mujaki reset") then
		eq.signal(204036,1); --signal reset to Etumer for 1st event
	elseif e.self:GetGM() and e.message:findi("get spawns") then	--get spawnpoints of nearby NPCS
		GetSpawnsMyLoc(e);
	elseif e.self:GetGM() and e.message:findi("mujaki signal") then
		eq.signal(204036, 99); --check count 
	end
end
	
function GetSpawnsMyLoc(e)
	local npc_list = eq.get_entity_list():GetNPCList();
	
	if(npc_list ~= nil) then
		for npc in npc_list.entries do								 
			if npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ()) <= 75 and npc:GetNPCTypeID() ~= scout and not npc:IsPet() and npc:GetNPCTypeID() ~= 167718 then
				npc:Shout("My spawnpoint id is: " .. npc:GetSpawnPointID());
				--return true	--mobs still in camp
			end
		end
	end
	
	return false
end








