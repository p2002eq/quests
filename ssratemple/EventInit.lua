-- Event controller in Ssra

function event_spawn(e)
	deactivate(e.self);
end

function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
end
