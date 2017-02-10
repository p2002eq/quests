-- A Dark Master, part of doomshade trigger

function event_death_complete(e)
    -- count Dark Masters (note that it counts itself as well)
	local npc_list = eq.get_entity_list():GetNPCList();
	local total = 0;
    if (npc_list ~= nil) then
        for npc in npc_list.entries do
			if (npc:GetNPCTypeID() == 176042) then total = total + 1; end
        end
    end
	
	-- if this is the last Dark Master and Doomshade lockout is not set, spawn Doomshade and set lockout
	local qglobals = eq.get_qglobals(e.self);
	if total <= 1 and qglobals['Doomshade'] == nil then
		-- eq.set_global("Doomshade","lockout",3,"D3");
		eq.set_global("Doomshade","lockout",3,"M5");
		eq.unique_spawn(176216, 0, 0, 127, -297, 0);
		eq.zone_emote(1, "A tortured scream echoes throughout the plains as a tormented spirit is released upon the land.");
	end
end