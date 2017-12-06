--a_spell_jammer (154147)
--Khati Sha Event

function event_spawn(e)
	if unique_check(e) then
		eq.depop();
	end
end

function event_death_complete(e)
	e.self:Say("No, I cannot fail!");
end

function unique_check(e)
	local npc_list = eq.get_entity_list():GetNPCList();
		
	if(npc_list ~= nil) then
		for npc in npc_list.entries do
			if npc:CalculateDistance(e.self:GetX(),e.self:GetY(),e.self:GetZ()) <= 5 and npc:GetNPCTypeID() == 154147 then
				return true;  --jammer in this location is still up, so will not spawn versus stacking up npcs
			end
		end
	else
		return false;  --returns false - no jammer already up so OK to spawn another
	end
end