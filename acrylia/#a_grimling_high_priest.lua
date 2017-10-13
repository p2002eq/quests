--#a_grimling_high_priest in AC (NPCID #154107)

local inCombat = false;

function event_spawn(e)
	deactivate(e.self)
end

function event_combat(e)
    if (e.joined == false) then
        inCombat = false;
    else
        inCombat = true;
		eq.stop_timer("deactivate");
		eq.set_timer("combat_check",1*1000);
    end
end

function event_timer(e)
    if (e.timer == "combat_check") then
       if (inCombat == false) then
			eq.stop_timer("combat_check");
			eq.set_timer("deactivate",3*60*1000);	-- 3 min till deactivated if not aggroed
        end
    elseif(e.timer == "deactivate") then	
		if (inCombat == false) then
			eq.stop_timer("combat_check");
			eq.signal(154109,1) -- send signal to event trigger that event can be reset
			deactivate(e.self);
		end
	end
end

function event_signal(e)	
	if e.signal == 2 then
		deactivate(e.self);
	else		--signal from event trigger to attack designated PC after summon
		activate(e.self);
		e.self:AddToHateList(eq.get_entity_list():GetClientByCharID(e.signal));
	end
end

function deactivate(mob)
	mob:SetHeading(65);
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
end

function activate(mob)
	mob:SetBodyType(1, true);
	mob:SetSpecialAbility(24, 0);
end

function event_death_complete(e)
	eq.signal(154109,1) -- send signal to event trigger that event can be reset
end