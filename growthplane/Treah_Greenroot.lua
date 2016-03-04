function event_combat(e)
	if (e.joined) then
        call_zone_to_assist(e.other);
	end
end

function call_zone_to_assist(e_other)       -- only specific mobs
    -- set to true to enable debug messages
    local show_debug = false;
    -- grab the entity list
    local entity_list = eq.get_entity_list();
    -- list of mobs that should aggro.
	local include_npc_list = Set {127003,127053};
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
            if (include_npc_list[npc:GetNPCTypeID()] ~= nil) then
                -- npc.valid will be true if the NPC is actually spawned
                if (npc.valid) then
                    npc:AddToHateList(e_other,1);
                    if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is valid, adding hate on " .. npc:GetName() .. "."); end
                else
                    if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is invalid, unable to add hate on " .. npc:GetName() .. "."); end
                end
            else
                if (show_debug) then e_other:Message(4,"NPCID: " .. npc:GetNPCTypeID() .. " is excluded, not adding hate on " .. npc:GetName() .. "."); end
            end
        end
	end
end

function Set (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

--function event_spawn(e)
--	eq.set_next_hp_event(50);
--end

--function event_hp(e)
--	if (e.hp_event == 50) then
--		call_zone_to_assist(e.other);
--		eq.set_next_hp_event(20);
--	elseif (e.hp_event == 20) then
--		call_zone_to_assist20(e.other);
--	end
end