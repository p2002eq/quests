function call_zone_to_assist50(e_other)
	-- set to true to enable debug messages
	local show_debug = false;
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- aggro the zone onto whoever attacked me.
	-- do not aggro these mobs #_Tunare (127001), #Tunare (127098), a_warm_light (127004)
	-- #BouncerMan (127097), Flighty_Viridian_Wisp (127105)
	local exclude_npc_list = Set {127001,127004,127097,127098,127105};
	local npc_list = Set {127053,127054};
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (exclude_npc_list[npc:GetNPCTypeID()] == nil) then
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

function call_zone_to_assist20(e_other)
	-- set to true to enable debug messages
	local show_debug = false;
	-- grab the entity list
	local entity_list = eq.get_entity_list();
	-- aggro the zone onto whoever attacked me.
	-- do not aggro these mobs #_Tunare (127001), #Tunare (127098), a_warm_light (127004)
	-- #BouncerMan (127097), Flighty_Viridian_Wisp (127105)
	local exclude_npc_list = Set {127001,127004,127097,127098,127105};
	local npc_list = Set {127055,127056,127061};
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (exclude_npc_list[npc:GetNPCTypeID()] == nil) then
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

function event_spawn(e)
	eq.set_next_hp_event(50);
end

function event_hp(e)
	
	if (e.hp_event == 50) then
		call_zone_to_assist50(e.other);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		call_zone_to_assist20(e.other);
		
	end
end