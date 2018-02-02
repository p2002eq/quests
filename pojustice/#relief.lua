--#relief (201517)
--Trial of Torture
--pojustice

function event_spawn(e)
	local mob_list = eq.get_entity_list():GetMobList();
	
	if mob_list ~= nil then
		for mob in mob_list.entries do
			if (mob:GetNPCTypeID() == 201483) then
				e.self:SpellFinished(1130,mob);	--Wave of Restoration  -- spell effect emote not working so added below
				mob:Emote("shivers as their wounds fade.");
			end
		end
	end
	eq.depop();
end

