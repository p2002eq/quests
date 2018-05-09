--Rahlgon
--ID:208176
--Zone:povalor 
--Guard of Aerin`Dar

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
			deactivate(e.self);
		end
	end
end

function event_signal(e)	
		deactivate(e.self);
end

function deactivate(mob)
	mob:SetBodyType(11, true);
	mob:SetSpecialAbility(24, 1);
	mob:WipeHateList();
end

function activate(mob)
	mob:SetBodyType(1, true);
	mob:SetSpecialAbility(24, 0);
end