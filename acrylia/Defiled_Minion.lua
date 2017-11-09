-- Defiled Minion (NPC ID: 154054)
-- Khati Sha Event

local activated = false;

function event_spawn(e)
	activated = false;
	deactivate(e.self);
	eq.set_timer("depop", 120*60*60);
end

function event_combat(e)
	if e.joined then
		eq.set_timer("combat check",15 * 1000);
	else
	end
end

function event_timer(e)
	if e.timer == "combat check" then
		if not e.self:IsEngaged() then
			eq.stop_timer(e.timer);
			deactivate(e.self);
		end
	end
end 

function event_signal(e)
	if e.signal == 1 then
		activate(e.self);
		e.self:AddToHateList(eq.get_entity_list():GetMobByNpcTypeID(154138):GetHateRandom(),1);
	end
end

function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
end

function activate(mob)
	mob:SetBodyType(3, true);
	mob:SetSpecialAbility(24, 0);
end