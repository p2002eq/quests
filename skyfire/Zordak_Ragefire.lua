-- EPIC CLERIC -skyfire-
function event_spawn(e)
	e.self:Say('The Triumvirate missionaries think their petty magic can affect me!! I will send your heads to Omat as a symbol of what is to come for all of his missionaries!')
	eq.set_timer("depop", 1800000)
end

function event_death_complete(e)
	local new_npc = eq.unique_spawn(91090,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- Zordakalicus_Ragefire
	new_npc:AddToHateList(e.other, 1);
end

function event_timer(e)
	if (e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end
