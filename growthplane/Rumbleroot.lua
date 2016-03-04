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
	local include_npc_list = Set {127108,127025,127031};
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (exclude_npc_list[npc:GetNPCTypeID()] ~= nil) then
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